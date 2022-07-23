# gamification.api.MainControllerApi

## Load the API package
```dart
import 'package:gamification/api.dart';
```

All URIs are relative to *http://localhost:8083*

Method | HTTP request | Description
------------- | ------------- | -------------
[**index**](MainControllerApi.md#index) | **GET** / | 


# **index**
> Map<String, String> index()



### Example
```dart
import 'package:gamification/api.dart';

final api = Gamification().getMainControllerApi();

try {
    final response = api.index();
    print(response);
} catch on DioError (e) {
    print('Exception when calling MainControllerApi->index: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**Map&lt;String, String&gt;**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

