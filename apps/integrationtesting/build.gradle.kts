import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

val kotlinVersion = "1.6.21"

plugins {
	id("org.springframework.boot") version "2.6.7"
	id("io.spring.dependency-management") version "1.0.11.RELEASE"
	war
	kotlin("jvm") version "1.6.21"
	kotlin("plugin.spring") version "1.6.21"
	id("com.diffplug.spotless") version "6.2.2"
  kotlin("plugin.serialization") version "1.6.21"
}

group = "com.abclever"
version = System.getenv("APP_VERSION") ?: "0.0.1-SNAPSHOT"
java.sourceCompatibility = JavaVersion.VERSION_17

repositories {
	mavenCentral()
}

dependencies {
  val cucumberVersion = "7.3.2"
  implementation("org.jetbrains.kotlin:kotlin-reflect:$kotlinVersion")
  implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8:$kotlinVersion")
  implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.3.3")
  implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.6.2")

  // Essentials
  implementation("org.slf4j:slf4j-api:1.7.36")

  // Project to test
  implementation("${group}:auth")

  testImplementation("org.jetbrains.kotlin:kotlin-test-junit5:$kotlinVersion")
  testImplementation("org.hamcrest:hamcrest:2.2")
  testImplementation("io.rest-assured:kotlin-extensions:5.1.1")

	testImplementation("org.junit.platform:junit-platform-suite:1.8.2")
  testImplementation("io.cucumber:cucumber-picocontainer:$cucumberVersion")
	testImplementation("io.cucumber:cucumber-junit-platform-engine:$cucumberVersion")
  testImplementation("io.cucumber:cucumber-java8:$cucumberVersion")
  testImplementation("io.cucumber:cucumber-junit:$cucumberVersion")
  testImplementation("org.assertj:assertj-guava:3.4.0")
}

tasks.withType<KotlinCompile> {
	kotlinOptions {
		freeCompilerArgs = listOf("-Xjsr305=strict")
		jvmTarget = "17"
	}
}

tasks.withType<Test> {
	useJUnitPlatform()
  systemProperty("cucumber.junit-platform.naming-strategy", "long")
}

configure<com.diffplug.gradle.spotless.SpotlessExtension> {

    format("misc") {
        // define the files to apply 'misc' to
        target("*.md", ".gitignore")

        // define the steps to apply to those files
        trimTrailingWhitespace()
        indentWithTabs() // or spaces. Takes an integer argument if you don't like 4
        endWithNewline()
    }

    kotlin { // to customize, go to https://github.com/diffplug/spotless/tree/main/plugin-gradle#kotlin

        // Apply ktfmt formatter(similar to google-java-format, but for Kotlin)
        ktfmt()
    }

    kotlinGradle {
        target("*.gradle.kts") // default target for kotlinGradle
        ktfmt()
    }
}
