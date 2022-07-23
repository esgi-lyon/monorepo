# DefaultApi

All URIs are relative to *http://0.0.0.0:3333*

| Method                                                                                   | HTTP request                        | Description |
| ---------------------------------------------------------------------------------------- | ----------------------------------- | ----------- |
| [**appControllerCallback**](DefaultApi.md#appControllerCallback)                         | **GET** /callback                   |
| [**appControllerIndex**](DefaultApi.md#appControllerIndex)                               | **GET** /                           |
| [**interactionControllerAbortLogin**](DefaultApi.md#interactionControllerAbortLogin)     | **GET** /interaction/{uid}/abort    |
| [**interactionControllerConfirmLogin**](DefaultApi.md#interactionControllerConfirmLogin) | **POST** /interaction/{uid}/confirm |
| [**interactionControllerLogin**](DefaultApi.md#interactionControllerLogin)               | **GET** /interaction/{uid}          |
| [**interactionControllerLoginCheck**](DefaultApi.md#interactionControllerLoginCheck)     | **POST** /interaction/{uid}         |
| [**ldapControllerDeletion**](DefaultApi.md#ldapControllerDeletion)                       | **DELETE** /ldap                    |
| [**ldapControllerRegister**](DefaultApi.md#ldapControllerRegister)                       | **POST** /ldap                      |
| [**ldapControllerUpdate**](DefaultApi.md#ldapControllerUpdate)                           | **PATCH** /ldap                     |

<a name="appControllerCallback"></a>

# **appControllerCallback**

> appControllerCallback()

### Example

```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import com.abclever.gen.authserver.model.*

val apiInstance = DefaultApi()
try {
    apiInstance.appControllerCallback()
} catch (e: ClientException) {
    println("4xx response calling DefaultApi#appControllerCallback")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling DefaultApi#appControllerCallback")
    e.printStackTrace()
}
```

### Parameters

This endpoint does not need any parameter.

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

<a name="appControllerIndex"></a>

# **appControllerIndex**

> appControllerIndex()

### Example

```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import com.abclever.gen.authserver.model.*

val apiInstance = DefaultApi()
try {
    apiInstance.appControllerIndex()
} catch (e: ClientException) {
    println("4xx response calling DefaultApi#appControllerIndex")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling DefaultApi#appControllerIndex")
    e.printStackTrace()
}
```

### Parameters

This endpoint does not need any parameter.

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

<a name="interactionControllerAbortLogin"></a>

# **interactionControllerAbortLogin**

> interactionControllerAbortLogin(uid)

### Example

```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import com.abclever.gen.authserver.model.*

val apiInstance = DefaultApi()
val uid : kotlin.String = uid_example // kotlin.String |
try {
    apiInstance.interactionControllerAbortLogin(uid)
} catch (e: ClientException) {
    println("4xx response calling DefaultApi#interactionControllerAbortLogin")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling DefaultApi#interactionControllerAbortLogin")
    e.printStackTrace()
}
```

### Parameters

| Name    | Type              | Description | Notes |
| ------- | ----------------- | ----------- | ----- |
| **uid** | **kotlin.String** |             |

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

<a name="interactionControllerConfirmLogin"></a>

# **interactionControllerConfirmLogin**

> interactionControllerConfirmLogin(uid)

### Example

```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import com.abclever.gen.authserver.model.*

val apiInstance = DefaultApi()
val uid : kotlin.String = uid_example // kotlin.String |
try {
    apiInstance.interactionControllerConfirmLogin(uid)
} catch (e: ClientException) {
    println("4xx response calling DefaultApi#interactionControllerConfirmLogin")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling DefaultApi#interactionControllerConfirmLogin")
    e.printStackTrace()
}
```

### Parameters

| Name    | Type              | Description | Notes |
| ------- | ----------------- | ----------- | ----- |
| **uid** | **kotlin.String** |             |

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

<a name="interactionControllerLogin"></a>

# **interactionControllerLogin**

> interactionControllerLogin(uid)

### Example

```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import com.abclever.gen.authserver.model.*

val apiInstance = DefaultApi()
val uid : kotlin.String = uid_example // kotlin.String |
try {
    apiInstance.interactionControllerLogin(uid)
} catch (e: ClientException) {
    println("4xx response calling DefaultApi#interactionControllerLogin")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling DefaultApi#interactionControllerLogin")
    e.printStackTrace()
}
```

### Parameters

| Name    | Type              | Description | Notes |
| ------- | ----------------- | ----------- | ----- |
| **uid** | **kotlin.String** |             |

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

<a name="interactionControllerLoginCheck"></a>

# **interactionControllerLoginCheck**

> interactionControllerLoginCheck(uid)

### Example

```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import com.abclever.gen.authserver.model.*

val apiInstance = DefaultApi()
val uid : kotlin.String = uid_example // kotlin.String |
try {
    apiInstance.interactionControllerLoginCheck(uid)
} catch (e: ClientException) {
    println("4xx response calling DefaultApi#interactionControllerLoginCheck")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling DefaultApi#interactionControllerLoginCheck")
    e.printStackTrace()
}
```

### Parameters

| Name    | Type              | Description | Notes |
| ------- | ----------------- | ----------- | ----- |
| **uid** | **kotlin.String** |             |

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

<a name="ldapControllerDeletion"></a>

# **ldapControllerDeletion**

> ldapControllerDeletion()

### Example

```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import com.abclever.gen.authserver.model.*

val apiInstance = DefaultApi()
try {
    apiInstance.ldapControllerDeletion()
} catch (e: ClientException) {
    println("4xx response calling DefaultApi#ldapControllerDeletion")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling DefaultApi#ldapControllerDeletion")
    e.printStackTrace()
}
```

### Parameters

This endpoint does not need any parameter.

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

<a name="ldapControllerRegister"></a>

# **ldapControllerRegister**

> ldapControllerRegister(userDto)

### Example

```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import com.abclever.gen.authserver.model.*

val apiInstance = DefaultApi()
val userDto : UserDto =  // UserDto |
try {
    apiInstance.ldapControllerRegister(userDto)
} catch (e: ClientException) {
    println("4xx response calling DefaultApi#ldapControllerRegister")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling DefaultApi#ldapControllerRegister")
    e.printStackTrace()
}
```

### Parameters

| Name        | Type                      | Description | Notes |
| ----------- | ------------------------- | ----------- | ----- |
| **userDto** | [**UserDto**](UserDto.md) |             |

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

<a name="ldapControllerUpdate"></a>

# **ldapControllerUpdate**

> ldapControllerUpdate(userDto)

### Example

```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import com.abclever.gen.authserver.model.*

val apiInstance = DefaultApi()
val userDto : UserDto =  // UserDto |
try {
    apiInstance.ldapControllerUpdate(userDto)
} catch (e: ClientException) {
    println("4xx response calling DefaultApi#ldapControllerUpdate")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling DefaultApi#ldapControllerUpdate")
    e.printStackTrace()
}
```

### Parameters

| Name        | Type                      | Description | Notes |
| ----------- | ------------------------- | ----------- | ----- |
| **userDto** | [**UserDto**](UserDto.md) |             |

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined
