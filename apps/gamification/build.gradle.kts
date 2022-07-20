import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
  id("org.springframework.boot") version "2.6.4"
  id("io.spring.dependency-management") version "1.0.11.RELEASE"
  war
  kotlin("jvm") version "1.6.10"
  kotlin("plugin.spring") version "1.6.10"
  id("com.diffplug.spotless") version "6.2.2"
  id("org.hidetake.swagger.generator") version "2.19.2"
  id("de.undercouch.download") version "5.1.0"
}

task<DefaultTask>("SwaggerDownload") {
  val url = "http://localhost:8083/v3/api-docs.yaml"
  download.run {
    src(url)
    dest(file("api-docs.yaml"))
  }
}

swaggerSources {
  create("api.gamification").apply {
    setInputFile(file("api-docs.yaml"))
    code(closureOf<org.hidetake.gradle.swagger.generator.GenerateSwaggerCode> {
      language = "java"
      library = "okhttp-gson"
      configFile = file("api-codegen.json")
    })
  }
}

group = "com.abcleaver"

version = System.getenv("APP_VERSION") ?: "0.0.1-SNAPSHOT"

java.sourceCompatibility = JavaVersion.VERSION_17

repositories { mavenCentral() }

dependencies {
  val springDocVersion = "1.6.8"

  implementation("org.springframework.boot:spring-boot-starter-web")
  implementation("org.jetbrains.kotlin:kotlin-reflect")
  implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
  providedRuntime("org.springframework.boot:spring-boot-starter-tomcat")
  testImplementation("org.springframework.boot:spring-boot-starter-test")

  implementation("io.swagger:swagger-annotations:1.6.6")
  implementation("io.swagger.core.v3:swagger-annotations:2.2.1")
  implementation("com.google.code.gson:gson:2.8.9")
  implementation("com.squareup.okhttp:okhttp:2.7.5")
  implementation("org.threeten:threetenbp:1.6.0")
  implementation("com.squareup.okhttp:logging-interceptor:2.7.5")
  implementation("io.gsonfire:gson-fire:1.8.5")
  implementation("com.brsanthu:migbase64:2.2")
  implementation("org.springdoc:springdoc-openapi-ui:${springDocVersion}")
  implementation("org.springdoc:springdoc-openapi-kotlin:${springDocVersion}")
  swaggerCodegen("io.swagger.codegen.v3:swagger-codegen-cli:3.0.34")
}

tasks.withType<KotlinCompile> {
  kotlinOptions {
    freeCompilerArgs = listOf("-Xjsr305=strict")
    jvmTarget = "17"
  }
}

tasks.withType<Test> { useJUnitPlatform() }

springBoot { buildInfo() }

