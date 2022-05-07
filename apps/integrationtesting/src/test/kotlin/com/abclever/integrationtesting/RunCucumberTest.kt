package com.abclever.integrationtesting

import kotlinx.coroutines.DelicateCoroutinesApi
import org.junit.platform.suite.api.IncludeEngines
import org.junit.platform.suite.api.SelectClasspathResource
import org.junit.platform.suite.api.Suite

@Suite
@IncludeEngines("cucumber")
@SelectClasspathResource("com.abclever.integrationtesting")
@DelicateCoroutinesApi
class RunCucumberTest
