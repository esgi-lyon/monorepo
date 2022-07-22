import org.jetbrains.kotlin.gradle.tasks.KotlinCompile
import org.openapitools.generator.gradle.plugin.tasks.GenerateTask

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
    val url = "http://0.0.0.0:8082/v3/api-docs.yaml"
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
  packageName.set("com.abclever.gen.auth")
  outputFolder.set("$buildDir/meta")
}

tasks.register<GenerateTask>("dartApi") {
  generatorName.set("dart")
  inputSpec.set("api-docs.yaml")
  outputDir.set("../front-mobile/packages/authapi")
  configOptions.set(
      mapOf(
          "pubName" to "authapi",
          "pubLibrary" to "abclever.api",
          "sourceFolder" to "authapi",
          "pubAuthorEmail" to "loic.roux@abclever.com"))
}

openApiGenerate {
  groupId.set("com.abclever.gen.auth")
  id.set("api")
  generatorName.set("kotlin")
  library.set("jvm-okhttp4")
  inputSpec.set("api-docs.yaml")
  outputDir.set("${file("./").absolutePath}/api")
  apiPackage.set("com.abclever.gen.auth.api")
  invokerPackage.set("com.abclever.gen.auth.invoker")
  modelPackage.set("com.abclever.gen.auth.model")
  configOptions.set(mapOf("dateLibrary" to "java11"))
}

// Auth server
val authServerOpenapiDoc = "../auth-server/api-docs-auth-server.json"

tasks.register<GenerateTask>("kotlinAuthServerApi") {
  groupId.set("com.abclever.gen.authserver")
  id.set("api")
  generatorName.set("kotlin")
  library.set("jvm-okhttp4")
  validateSpec.set(false)
  inputSpec.set(authServerOpenapiDoc)
  outputDir.set("${file("../auth-server").absolutePath}/api")
  apiPackage.set("com.abclever.gen.authserver.api")
  invokerPackage.set("com.abclever.gen.authserver.invoker")
  modelPackage.set("com.abclever.gen.authserver.model")
  configOptions.set(mapOf("dateLibrary" to "java11"))
}

tasks.register<GenerateTask>("dartAuthServerApi") {
  generatorName.set("dart")
  inputSpec.set(authServerOpenapiDoc)
  outputDir.set("../front-mobile/packages/authserverapi")
  validateSpec.set(false)
  configOptions.set(
      mapOf(
          "pubName" to "authserver",
          "pubLibrary" to "abclever.api",
          "sourceFolder" to "authserver",
          "pubAuthorEmail" to "loic.roux@abclever.com"))
}

group = "com.abclever"

version = System.getenv("APP_VERSION") ?: "0.0.1-SNAPSHOT"

java.sourceCompatibility = JavaVersion.VERSION_17

repositories { mavenCentral() }

dependencies {
  val springDocVersion = "1.6.8"
  val okhttpVersion = "4.10.0"

  implementation("org.springframework.boot:spring-boot-starter-web")
  implementation("org.springframework.boot:spring-boot-starter-validation")
  implementation("org.springdoc:springdoc-openapi-ui:${springDocVersion}")
  implementation("org.springdoc:springdoc-openapi-kotlin:${springDocVersion}")

  implementation("org.jetbrains.kotlin:kotlin-reflect")
  implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
  implementation("org.jetbrains.kotlin:kotlin-noarg")

  implementation("org.springframework.boot:spring-boot-starter-security")
  implementation("org.springframework.boot:spring-boot-starter-oauth2-client")
  implementation("org.springframework.boot:spring-boot-starter-oauth2-resource-server")
  implementation("org.springdoc:springdoc-openapi-security:1.6.6")

  implementation("org.projectlombok:lombok:1.18.22")
  implementation("org.springframework.boot:spring-boot-starter-data-jpa")
  runtimeOnly("com.h2database:h2")
  runtimeOnly("org.postgresql:postgresql")
  implementation("org.springframework.boot:spring-boot-starter-jdbc")

  // http client
  implementation("io.swagger.core.v3:swagger-annotations:2.2.1")
  implementation("com.google.code.gson:gson:2.8.9")
  implementation("com.squareup.okhttp3:okhttp:$okhttpVersion")
  implementation("com.squareup.okhttp3:logging-interceptor:$okhttpVersion")

  implementation("org.springframework.security:spring-security-test")
  providedRuntime("org.springframework.boot:spring-boot-starter-tomcat")
  testImplementation("org.springframework.boot:spring-boot-starter-test")
}

tasks.withType<KotlinCompile> {
  dependsOn("dartAuthServerApi", "kotlinAuthServerApi", "dartApi", tasks.openApiGenerate)
  kotlinOptions {
    freeCompilerArgs = listOf("-Xjsr305=strict", "-Xopt-in=kotlin.RequiresOptIn")
    jvmTarget = "17"
  }
}

tasks.withType<Test> { useJUnitPlatform() }

springBoot {}

var env: String? = System.getenv("NODE_ENV")

System.setProperty("spring.profiles.active", env ?: "dev")

configure<com.diffplug.gradle.spotless.SpotlessExtension> {
  format("misc") {
    // define the files to apply 'misc' to
    target("*.md", ".gitignore")

    // define the steps to apply to those files
    trimTrailingWhitespace()
    indentWithTabs() // or spaces. Takes an integer argument if you don't like 4
    endWithNewline()
  }

  kotlin { // to customize, go to
    // https://github.com/diffplug/spotless/tree/main/plugin-gradle#kotlin

    // Apply ktfmt formatter(similar to google-java-format, but for Kotlin)
    ktfmt()
  }

  kotlinGradle {
    target("*.gradle.kts") // default target for kotlinGradle
    ktfmt()
  }
}
