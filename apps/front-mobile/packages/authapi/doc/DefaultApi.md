# authserver.api.DefaultApi

## Load the API package
```dart
import 'package:authserver/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**appControllerIndex**](DefaultApi.md#appcontrollerindex) | **GET** / | 
[**appControllerTest**](DefaultApi.md#appcontrollertest) | **GET** /callback | 
[**interactionControllerAbortLogin**](DefaultApi.md#interactioncontrollerabortlogin) | **GET** /interaction/{uid}/abort | 
[**interactionControllerConfirmLogin**](DefaultApi.md#interactioncontrollerconfirmlogin) | **POST** /interaction/{uid}/confirm | 
[**interactionControllerLogin**](DefaultApi.md#interactioncontrollerlogin) | **GET** /interaction/{uid} | 
[**interactionControllerLoginCheck**](DefaultApi.md#interactioncontrollerlogincheck) | **POST** /interaction/{uid} | 
[**ldapControllerDeletion**](DefaultApi.md#ldapcontrollerdeletion) | **DELETE** /ldap | 
[**ldapControllerRegister**](DefaultApi.md#ldapcontrollerregister) | **POST** /ldap | 
[**ldapControllerUpdate**](DefaultApi.md#ldapcontrollerupdate) | **PATCH** /ldap | 


# **appControllerIndex**
> appControllerIndex()



### Example
```dart
import 'package:authserver/api.dart';

final api_instance = DefaultApi();

try {
    api_instance.appControllerIndex();
} catch (e) {
    print('Exception when calling DefaultApi->appControllerIndex: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **appControllerTest**
> appControllerTest()



### Example
```dart
import 'package:authserver/api.dart';

final api_instance = DefaultApi();

try {
    api_instance.appControllerTest();
} catch (e) {
    print('Exception when calling DefaultApi->appControllerTest: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **interactionControllerAbortLogin**
> interactionControllerAbortLogin(uid)



### Example
```dart
import 'package:authserver/api.dart';

final api_instance = DefaultApi();
final uid = uid_example; // String | 

try {
    api_instance.interactionControllerAbortLogin(uid);
} catch (e) {
    print('Exception when calling DefaultApi->interactionControllerAbortLogin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uid** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **interactionControllerConfirmLogin**
> interactionControllerConfirmLogin(uid)



### Example
```dart
import 'package:authserver/api.dart';

final api_instance = DefaultApi();
final uid = uid_example; // String | 

try {
    api_instance.interactionControllerConfirmLogin(uid);
} catch (e) {
    print('Exception when calling DefaultApi->interactionControllerConfirmLogin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uid** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **interactionControllerLogin**
> interactionControllerLogin(uid)



### Example
```dart
import 'package:authserver/api.dart';

final api_instance = DefaultApi();
final uid = uid_example; // String | 

try {
    api_instance.interactionControllerLogin(uid);
} catch (e) {
    print('Exception when calling DefaultApi->interactionControllerLogin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uid** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **interactionControllerLoginCheck**
> interactionControllerLoginCheck(uid)



### Example
```dart
import 'package:authserver/api.dart';

final api_instance = DefaultApi();
final uid = uid_example; // String | 

try {
    api_instance.interactionControllerLoginCheck(uid);
} catch (e) {
    print('Exception when calling DefaultApi->interactionControllerLoginCheck: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uid** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ldapControllerDeletion**
> ldapControllerDeletion()



### Example
```dart
import 'package:authserver/api.dart';

final api_instance = DefaultApi();

try {
    api_instance.ldapControllerDeletion();
} catch (e) {
    print('Exception when calling DefaultApi->ldapControllerDeletion: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ldapControllerRegister**
> ldapControllerRegister(userDto)



### Example
```dart
import 'package:authserver/api.dart';

final api_instance = DefaultApi();
final userDto = UserDto(); // UserDto | 

try {
    api_instance.ldapControllerRegister(userDto);
} catch (e) {
    print('Exception when calling DefaultApi->ldapControllerRegister: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userDto** | [**UserDto**](UserDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ldapControllerUpdate**
> ldapControllerUpdate(userDto)



### Example
```dart
import 'package:authserver/api.dart';

final api_instance = DefaultApi();
final userDto = UserDto(); // UserDto | 

try {
    api_instance.ldapControllerUpdate(userDto);
} catch (e) {
    print('Exception when calling DefaultApi->ldapControllerUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userDto** | [**UserDto**](UserDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

