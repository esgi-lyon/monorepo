# MainControllerApi

All URIs are relative to *http://0.0.0.0:8082*

Method | HTTP request | Description
------------- | ------------- | -------------
[**home**](MainControllerApi.md#home) | **GET** / | 
[**me**](MainControllerApi.md#me) | **GET** /me | 


<a name="home"></a>
# **home**
> kotlin.collections.Map&lt;kotlin.String, kotlin.String&gt; home()



### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import com.abclever.gen.auth.model.*

val apiInstance = MainControllerApi()
try {
    val result : kotlin.collections.Map<kotlin.String, kotlin.String> = apiInstance.home()
    println(result)
} catch (e: ClientException) {
    println("4xx response calling MainControllerApi#home")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling MainControllerApi#home")
    e.printStackTrace()
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**kotlin.collections.Map&lt;kotlin.String, kotlin.String&gt;**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

<a name="me"></a>
# **me**
> OidcUser me()



### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import com.abclever.gen.auth.model.*

val apiInstance = MainControllerApi()
try {
    val result : OidcUser = apiInstance.me()
    println(result)
} catch (e: ClientException) {
    println("4xx response calling MainControllerApi#me")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling MainControllerApi#me")
    e.printStackTrace()
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**OidcUser**](OidcUser.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

