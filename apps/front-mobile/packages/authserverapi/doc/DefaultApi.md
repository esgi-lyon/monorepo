# authserver.api.DefaultApi

## Load the API package
```dart
import 'package:authserver/api.dart';
```

All URIs are relative to *http://0.0.0.0:3333*

Method | HTTP request | Description
------------- | ------------- | -------------
[**appControllerCallback**](DefaultApi.md#appcontrollercallback) | **GET** /callback | 
[**appControllerIndex**](DefaultApi.md#appcontrollerindex) | **GET** / | 
[**interactionControllerAbortLogin**](DefaultApi.md#interactioncontrollerabortlogin) | **GET** /interaction/{uid}/abort | 
[**interactionControllerConfirmLogin**](DefaultApi.md#interactioncontrollerconfirmlogin) | **POST** /interaction/{uid}/confirm | 
[**interactionControllerLogin**](DefaultApi.md#interactioncontrollerlogin) | **GET** /interaction/{uid} | 
[**interactionControllerLoginCheck**](DefaultApi.md#interactioncontrollerlogincheck) | **POST** /interaction/{uid} | 
[**ldapControllerDeletion**](DefaultApi.md#ldapcontrollerdeletion) | **DELETE** /ldap | 
[**ldapControllerFindByEmail**](DefaultApi.md#ldapcontrollerfindbyemail) | **GET** /ldap | 
[**ldapControllerRegister**](DefaultApi.md#ldapcontrollerregister) | **POST** /ldap | 
[**ldapControllerUpdate**](DefaultApi.md#ldapcontrollerupdate) | **PATCH** /ldap | 


# **appControllerCallback**
> appControllerCallback()



### Example
```dart
import 'package:authserver/api.dart';

final api = Authserver().getDefaultApi();

try {
    api.appControllerCallback();
} catch on DioError (e) {
    print('Exception when calling DefaultApi->appControllerCallback: $e\n');
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

# **appControllerIndex**
> appControllerIndex()



### Example
```dart
import 'package:authserver/api.dart';

final api = Authserver().getDefaultApi();

try {
    api.appControllerIndex();
} catch on DioError (e) {
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

# **interactionControllerAbortLogin**
> interactionControllerAbortLogin(uid)



### Example
```dart
import 'package:authserver/api.dart';

final api = Authserver().getDefaultApi();
final String uid = uid_example; // String | 

try {
    api.interactionControllerAbortLogin(uid);
} catch on DioError (e) {
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

final api = Authserver().getDefaultApi();
final String uid = uid_example; // String | 

try {
    api.interactionControllerConfirmLogin(uid);
} catch on DioError (e) {
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

final api = Authserver().getDefaultApi();
final String uid = uid_example; // String | 

try {
    api.interactionControllerLogin(uid);
} catch on DioError (e) {
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
> interactionControllerLoginCheck(uid, loginDto)



### Example
```dart
import 'package:authserver/api.dart';

final api = Authserver().getDefaultApi();
final String uid = uid_example; // String | 
final LoginDto loginDto = ; // LoginDto | 

try {
    api.interactionControllerLoginCheck(uid, loginDto);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->interactionControllerLoginCheck: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uid** | **String**|  | 
 **loginDto** | [**LoginDto**](LoginDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ldapControllerDeletion**
> num ldapControllerDeletion()



### Example
```dart
import 'package:authserver/api.dart';

final api = Authserver().getDefaultApi();

try {
    final response = api.ldapControllerDeletion();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->ldapControllerDeletion: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**num**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ldapControllerFindByEmail**
> UserDto ldapControllerFindByEmail(email)



### Example
```dart
import 'package:authserver/api.dart';

final api = Authserver().getDefaultApi();
final String email = email_example; // String | 

try {
    final response = api.ldapControllerFindByEmail(email);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->ldapControllerFindByEmail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | 

### Return type

[**UserDto**](UserDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ldapControllerRegister**
> RegisterResultDto ldapControllerRegister(registerUserDto)



### Example
```dart
import 'package:authserver/api.dart';

final api = Authserver().getDefaultApi();
final RegisterUserDto registerUserDto = ; // RegisterUserDto | 

try {
    final response = api.ldapControllerRegister(registerUserDto);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->ldapControllerRegister: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerUserDto** | [**RegisterUserDto**](RegisterUserDto.md)|  | 

### Return type

[**RegisterResultDto**](RegisterResultDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ldapControllerUpdate**
> UpdateResultDto ldapControllerUpdate(updateUserDto)



### Example
```dart
import 'package:authserver/api.dart';

final api = Authserver().getDefaultApi();
final UpdateUserDto updateUserDto = ; // UpdateUserDto | 

try {
    final response = api.ldapControllerUpdate(updateUserDto);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->ldapControllerUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateUserDto** | [**UpdateUserDto**](UpdateUserDto.md)|  | 

### Return type

[**UpdateResultDto**](UpdateResultDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

