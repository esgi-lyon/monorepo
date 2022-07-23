# quizz.api.MainControllerApi

## Load the API package
```dart
import 'package:quizz/api.dart';
```

All URIs are relative to *http://localhost:8085*

Method | HTTP request | Description
------------- | ------------- | -------------
[**index**](MainControllerApi.md#index) | **GET** / | 


# **index**
> String index()



### Example
```dart
import 'package:quizz/api.dart';

final api = Quizz().getMainControllerApi();

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

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

