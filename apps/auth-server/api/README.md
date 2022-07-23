# org.openapitools.client - Kotlin client library for Authentication server

## Requires

- Kotlin 1.4.30
- Gradle 6.8.3

## Build

First, create the gradle wrapper script:

```
gradle wrapper
```

Then, run:

```
./gradlew check assemble
```

This runs all tests and packages the library.

## Features/Implementation Notes

- Supports JSON inputs/outputs, File inputs, and Form inputs.
- Supports collection formats for query parameters: csv, tsv, ssv, pipes.
- Some Kotlin and Java types are fully qualified to avoid conflicts with types defined in OpenAPI definitions.
- Implementation of ApiClient is intended to reduce method counts, specifically to benefit Android targets.

<a name="documentation-for-api-endpoints"></a>

## Documentation for API Endpoints

All URIs are relative to *http://0.0.0.0:3333*

| Class        | Method                                                                                        | HTTP request                        | Description |
| ------------ | --------------------------------------------------------------------------------------------- | ----------------------------------- | ----------- |
| _DefaultApi_ | [**appControllerCallback**](docs/DefaultApi.md#appcontrollercallback)                         | **GET** /callback                   |
| _DefaultApi_ | [**appControllerIndex**](docs/DefaultApi.md#appcontrollerindex)                               | **GET** /                           |
| _DefaultApi_ | [**interactionControllerAbortLogin**](docs/DefaultApi.md#interactioncontrollerabortlogin)     | **GET** /interaction/{uid}/abort    |
| _DefaultApi_ | [**interactionControllerConfirmLogin**](docs/DefaultApi.md#interactioncontrollerconfirmlogin) | **POST** /interaction/{uid}/confirm |
| _DefaultApi_ | [**interactionControllerLogin**](docs/DefaultApi.md#interactioncontrollerlogin)               | **GET** /interaction/{uid}          |
| _DefaultApi_ | [**interactionControllerLoginCheck**](docs/DefaultApi.md#interactioncontrollerlogincheck)     | **POST** /interaction/{uid}         |
| _DefaultApi_ | [**ldapControllerDeletion**](docs/DefaultApi.md#ldapcontrollerdeletion)                       | **DELETE** /ldap                    |
| _DefaultApi_ | [**ldapControllerRegister**](docs/DefaultApi.md#ldapcontrollerregister)                       | **POST** /ldap                      |
| _DefaultApi_ | [**ldapControllerUpdate**](docs/DefaultApi.md#ldapcontrollerupdate)                           | **PATCH** /ldap                     |

<a name="documentation-for-models"></a>

## Documentation for Models

- [com.abclever.gen.authserver.model.UserDto](docs/UserDto.md)

<a name="documentation-for-authorization"></a>

## Documentation for Authorization

All endpoints do not require authorization.
