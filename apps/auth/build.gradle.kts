import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
  id("org.springframework.boot") version "2.6.7"
  id("io.spring.dependency-management") version "1.0.11.RELEASE"
  war
  kotlin("jvm") version "1.6.10"
  kotlin("plugin.spring") version "1.6.10"
  id("com.diffplug.spotless") version "6.2.2"
}

group = "com.abclever"

version = System.getenv("APP_VERSION") ?: "0.0.1-SNAPSHOT"

java.sourceCompatibility = JavaVersion.VERSION_17

repositories { mavenCentral() }

dependencies {
  val springDocVersion = "1.6.8"
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

  implementation("org.springframework.security:spring-security-test")
  providedRuntime("org.springframework.boot:spring-boot-starter-tomcat")
  testImplementation("org.springframework.boot:spring-boot-starter-test")
}

tasks.withType<KotlinCompile> {
  kotlinOptions {
    freeCompilerArgs = listOf("-Xjsr305=strict")
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
