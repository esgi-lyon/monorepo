//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of abclever.api;


class DefaultApi {
  DefaultApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /' operation and returns the [Response].
  Future<Response> appControllerIndexWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<void> appControllerIndex() async {
    final response = await appControllerIndexWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /callback' operation and returns the [Response].
  Future<Response> appControllerTestWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/callback';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<void> appControllerTest() async {
    final response = await appControllerTestWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /interaction/{uid}/abort' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] uid (required):
  Future<Response> interactionControllerAbortLoginWithHttpInfo(String uid,) async {
    // ignore: prefer_const_declarations
    final path = r'/interaction/{uid}/abort'
      .replaceAll('{uid}', uid);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] uid (required):
  Future<void> interactionControllerAbortLogin(String uid,) async {
    final response = await interactionControllerAbortLoginWithHttpInfo(uid,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /interaction/{uid}/confirm' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] uid (required):
  Future<Response> interactionControllerConfirmLoginWithHttpInfo(String uid,) async {
    // ignore: prefer_const_declarations
    final path = r'/interaction/{uid}/confirm'
      .replaceAll('{uid}', uid);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] uid (required):
  Future<void> interactionControllerConfirmLogin(String uid,) async {
    final response = await interactionControllerConfirmLoginWithHttpInfo(uid,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /interaction/{uid}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] uid (required):
  Future<Response> interactionControllerLoginWithHttpInfo(String uid,) async {
    // ignore: prefer_const_declarations
    final path = r'/interaction/{uid}'
      .replaceAll('{uid}', uid);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] uid (required):
  Future<void> interactionControllerLogin(String uid,) async {
    final response = await interactionControllerLoginWithHttpInfo(uid,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /interaction/{uid}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] uid (required):
  Future<Response> interactionControllerLoginCheckWithHttpInfo(String uid,) async {
    // ignore: prefer_const_declarations
    final path = r'/interaction/{uid}'
      .replaceAll('{uid}', uid);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] uid (required):
  Future<void> interactionControllerLoginCheck(String uid,) async {
    final response = await interactionControllerLoginCheckWithHttpInfo(uid,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'DELETE /ldap' operation and returns the [Response].
  Future<Response> ldapControllerDeletionWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/ldap';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<void> ldapControllerDeletion() async {
    final response = await ldapControllerDeletionWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /ldap' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [UserDto] userDto (required):
  Future<Response> ldapControllerRegisterWithHttpInfo(UserDto userDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/ldap';

    // ignore: prefer_final_locals
    Object? postBody = userDto;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [UserDto] userDto (required):
  Future<void> ldapControllerRegister(UserDto userDto,) async {
    final response = await ldapControllerRegisterWithHttpInfo(userDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PATCH /ldap' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [UserDto] userDto (required):
  Future<Response> ldapControllerUpdateWithHttpInfo(UserDto userDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/ldap';

    // ignore: prefer_final_locals
    Object? postBody = userDto;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PATCH',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [UserDto] userDto (required):
  Future<void> ldapControllerUpdate(UserDto userDto,) async {
    final response = await ldapControllerUpdateWithHttpInfo(userDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
