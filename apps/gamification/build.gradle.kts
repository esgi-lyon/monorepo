import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
  id("org.springframework.boot") version "2.6.7"
  id("io.spring.dependency-management") version "1.0.11.RELEASE"
  war
  kotlin("jvm") version "1.6.10"
  kotlin("plugin.spring") version "1.6.10"
  id("com.diffplug.spotless") version "6.2.2"
  id("org.openapi.generator") version "6.0.1"
  id("de.undercouch.download") version "5.1.0"
}

tasks.register("SwaggerDownload") {
  doLast {
    val url = "http://localhost:8083/v3/api-docs.yaml"
    download {
      run {
        src(url)
        dest(file("api-docs.yaml"))
        overwrite(true)
      }
    }
  }
}

openApiMeta {
  generatorName.set("kotlin")
  packageName.set("com.abclever.gen.gamification")
  outputFolder.set("$buildDir/meta")
}

openApiGenerate {
  groupId.set("com.abclever.gen.gamification")
  id.set("api")
  generatorName.set("kotlin")
  library.set("jvm-okhttp4")
  inputSpec.set("api-docs.yaml")
  outputDir.set("${file("./").absolutePath}/api")
  apiPackage.set("com.abclever.gen.gamification.api")
  invokerPackage.set("com.abclever.gen.gamification.invoker")
  modelPackage.set("com.abclever.gen.gamification.model")
  configOptions.set(mapOf(
    "dateLibrary" to "java11"
  ))
}

group = "com.abcleaver"

version = System.getenv("APP_VERSION") ?: "0.0.1-SNAPSHOT"

java.sourceCompatibility = JavaVersion.VERSION_17

repositories { mavenCentral() }

dependencies {
  val springDocVersion = "1.6.8"
  val okhttpVersion = "4.10.0"

  implementation("org.springframework.boot:spring-boot-starter-web")
  implementation("org.jetbrains.kotlin:kotlin-reflect")
  implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
  providedRuntime("org.springframework.boot:spring-boot-starter-tomcat")
  testImplementation("org.springframework.boot:spring-boot-starter-test")

  implementation("io.swagger.core.v3:swagger-annotations:2.2.1")
  implementation("com.google.code.gson:gson:2.8.9")
  implementation("com.squareup.okhttp3:okhttp:$okhttpVersion")
  implementation("com.squareup.okhttp3:logging-interceptor:$okhttpVersion")
  implementation("org.springdoc:springdoc-openapi-ui:${springDocVersion}")
  implementation("org.springdoc:springdoc-openapi-kotlin:${springDocVersion}")
}

tasks.withType<KotlinCompile> {
  dependsOn(tasks.openApiGenerate)
  kotlinOptions {
    freeCompilerArgs = listOf("-Xjsr305=strict", "-Xopt-in=kotlin.RequiresOptIn")
    jvmTarget = "17"
  }
}

tasks.withType<Test> { useJUnitPlatform() }

springBoot { buildInfo() }

