# gamificationapi.api.MainControllerApi

## Load the API package
```dart
import 'package:gamificationapi/api.dart';
```

All URIs are relative to *http://localhost:8083*

Method | HTTP request | Description
------------- | ------------- | -------------
[**index**](MainControllerApi.md#index) | **GET** / | 


# **index**
> Map<String, String> index()



### Example
```dart
import 'package:gamificationapi/api.dart';

final api_instance = MainControllerApi();

try {
    final result = api_instance.index();
    print(result);
} catch (e) {
    print('Exception when calling MainControllerApi->index: $e\n');
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

