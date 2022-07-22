# authapi.api.MainControllerApi

## Load the API package
```dart
import 'package:authapi/api.dart';
```

All URIs are relative to *http://localhost:8082*

Method | HTTP request | Description
------------- | ------------- | -------------
[**home**](MainControllerApi.md#home) | **GET** / | 


# **home**
> Map<String, String> home()



### Example
```dart
import 'package:authapi/api.dart';

final api_instance = MainControllerApi();

try {
    final result = api_instance.home();
    print(result);
} catch (e) {
    print('Exception when calling MainControllerApi->home: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**Map<String, String>**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

