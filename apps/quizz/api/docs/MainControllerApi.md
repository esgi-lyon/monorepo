# MainControllerApi

All URIs are relative to *http://localhost:8085*

Method | HTTP request | Description
------------- | ------------- | -------------
[**index**](MainControllerApi.md#index) | **GET** / | 


<a name="index"></a>
# **index**
> kotlin.String index()



### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import com.abclever.gen.quizz.model.*

val apiInstance = MainControllerApi()
try {
    val result : kotlin.String = apiInstance.index()
    println(result)
} catch (e: ClientException) {
    println("4xx response calling MainControllerApi#index")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling MainControllerApi#index")
    e.printStackTrace()
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**kotlin.String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

