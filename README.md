# Flutter Clean Architecture Template

A template for Flutter projects to help developers start new Flutter projects with a solid architecture that is easy to maintain and scale to create a high-quality application.

## Clean Architecture

The Clean Architecture is a software design philosophy that originated from the ideas of Robert C. Martin (Uncle Bob), aiming to create robust and easily maintainable systems. It advocates for clear separation of concerns and independence from external frameworks, promoting a flexible and adaptable architecture. By adopting the principles of Clean Architecture, developers can build applications that are easier to understand, test, and evolve over time. This approach is particularly useful in projects requiring long-term maintenance and scalability, offering a solid foundation for constructing complex applications in Flutter and other platforms.

|             |
|:------------:|
| ![img.png](assets/architecture_diagram.png) |


### Domain Layer

The Domain Layer serves as the core of the application, housing its fundamental business logic. This layer is designed to be independent of any external dependencies, fostering modularity and facilitating ease of testing. Within the Domain Layer, you'll find entities, use cases, repositories, and error handling mechanisms.

#### Entities

Entities represent the core data structures or business objects of the application. They encapsulate the essential properties and behaviors that define the application's domain. Entities are typically plain Dart classes that model real-world concepts relevant to the application.

#### Use Cases (Interactors)

Use Cases, also known as Interactors, encapsulate specific application behaviors or use cases. They orchestrate the execution of business logic by interacting with entities and repositories. Use Cases are responsible for coordinating the flow of data and enforcing business rules, ensuring the integrity of the application's logic.

#### Repositories

Repositories act as an abstraction layer between the Domain Layer and the Data Layer. They define a set of interfaces or contracts that specify how data should be accessed and manipulated. Repositories provide methods for retrieving and storing data, shielding the Domain Layer from the details of data storage and retrieval mechanisms. Implementations of repositories are typically found in the Data Layer, while interfaces reside in the Domain Layer, allowing for easy substitution of data sources without impacting the application's core logic.

#### Failures

Within the Domain Layer, mechanisms for handling failures and errors are defined. These can include custom exception classes, error enums, or result types to communicate and manage failures gracefully. By centralizing error handling within the Domain Layer, the application can maintain a consistent approach to error reporting and recovery, enhancing reliability and maintainability.

### Data Layer

The Data Layer serves as the implementation hub for repositories defined in the Domain Layer. Its primary role revolves around data management, including retrieval from diverse sources such as network APIs, local databases, or any other relevant data store. Within this layer, repositories are implemented to handle data access and manipulation, ensuring seamless interaction between the application and external data sources. Additionally, the Data Layer encompasses the definition and structure of data models, which represent the data entities manipulated within the application. These models encapsulate the properties and behaviors of data entities, providing a structured format for data management throughout the application.

### Presentation Layer - Modules

The Presentation Layer encompasses the User Interface (UI) of the application. Its primary responsibility lies in presenting data to the user and managing user interactions. This layer communicates with the UseCases in the Domain Layer to obtain data and update the UI accordingly. To achieve modularity and separation of concerns, I've opted to organize the Presentation Layer into multiple modules. Each module handles distinct parts of the application, allowing for better organization and scalability. Within these modules, various state management solutions such as Provider, Bloc, Riverpod, or MobX can be employed to facilitate efficient management of application state.

### Folder Structure

```bash
├── app
│   ├── modules
│   │   └── module_name
│   │       ├── pages
│   │       ├── widgets
│   │       └── controllers / providers / blocs
│   │
│   └── shared
│       ├── data
│       │   ├── models
│       │   └── repositories
│       │
│       ├── domain
│       │   ├── entities
│       │   ├── failures
│       │   ├── repositories
│       │   └── usecases
│       │   
│       ├── helpers
│       │   ├── enums
│       │   ├── environments
│       │   ├── functions
│       │   ├── services
│       │   │   ├── dio
│       │   │   ├── uno
│       │   │   ├── firebase
│       │   │   └── shared_preferences
│       │   └── utils
│       │
│       ├── presentation
│       │   ├── pages
│       │   ├── widgets
│       │   └── controllers
│       │
│       └── themes
│   
├── generated
│   └── intl
│ 
├── l10n
│
└── tests
    └── app
        ├── modules
        │   └── module_name
        │       ├── pages
        │       ├── widgets
        │       └── controllers / providers / blocs
        └── shared
            ├── data
            │   ├── models
            │   └── repositories
            │
            └── domain
                ├── entities
                ├── failures
                ├── repositories
                └── usecases
```

## Routing

The [go_router](https://pub.dev/packages/go_router) is a lightweight and straightforward routing package for Flutter applications, simplifying the process of navigation between screens. It provides an intuitive API for defining routes and managing navigation within the application. With its simplicity and ease of use, the GoRouter is ideal for efficiently handling screen transitions and organizing navigation logic in Flutter projects.

## Dependency Injection

The [auto_injector](https://pub.dev/packages/auto_injector) package from Flutterando simplifies dependency injection in Flutter applications, offering an intuitive way to manage dependencies across the codebase. By automating the process of dependency injection, developers can easily instantiate and access objects without the need for manual setup, enhancing code readability and maintainability, making it an ideal choice for managing dependencies in complex Flutter applications.

## Internationalization (l10n)

The [flutter_intl](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl) IDE extension simplifies internationalization (l10n) in Flutter applications, providing a seamless way to manage localization keys and translations directly within your IDE. By automating the process of internationalization, developers can efficiently handle multilingual support for their Flutter apps, improving user accessibility and reach. With its intuitive interface and powerful features, flutter_intl enhances the localization workflow, making it an indispensable tool for building global-ready Flutter applications.

## Network

We have multiple ways to use network requests in Flutter, but the most common and recommended way is to use the [dio](https://pub.dev/packages/dio) package. Dio is a powerful HTTP client for Dart and Flutter, providing a simple and flexible API for making network requests. With its support for various features such as interceptors, request cancellation, and error handling, Dio simplifies the process of working with APIs and managing network requests in Flutter applications. By leveraging Dio, developers can create robust and efficient networking solutions, enabling seamless communication with external services and data sources.

## Tests

[Testing](https://docs.flutter.dev/testing/overview) is an essential aspect of software development, ensuring the reliability and quality of applications. In Flutter, we can write different types of tests, including unit tests, widget tests, and integration tests, to validate the behavior and functionality of our code. By writing tests, developers can identify bugs early, prevent regressions, and maintain the stability of their applications. The Flutter testing framework provides a comprehensive suite of tools and utilities for writing tests, making it easy to create and run tests for various parts of the application. By adopting a test-driven development (TDD) approach, developers can build robust and maintainable Flutter applications with confidence.

## Staging

Staging environments are essential for testing and validating applications before deployment to production. By setting up staging environments, developers can verify the functionality and performance of their applications in a controlled environment, ensuring that they meet the desired quality standards. In Flutter, we can configure staging environments by defining different configurations for development, staging, and production builds. By leveraging environment-specific configurations, developers can manage API endpoints, feature flags, and other settings based on the deployment environment, facilitating efficient testing and validation of applications. Staging environments play a crucial role in the software development lifecycle, enabling developers to identify and address issues early, leading to more reliable and robust applications.

## Themes

This template provides an easily customizable theming structure, including definitions for colors, text styles, and light/dark themes. The provided themes are designed to be easily tailored to fit the project's needs. For instance, you can customize primary, secondary, and accent colors to match your application's visual identity. Additionally, text styles can be adjusted to ensure visual consistency throughout the application. Support for light and dark themes is built-in, allowing end-users to select their preferred theme preference. With this flexible theming structure, you can create a cohesive and visually appealing user experience for your Flutter application.

## Name Format

### Files and Directories

- Files have the same name as the classes
- snake_case

### Classes

- CammelCase
- **Entity** suffix for entities (e.g., UserEntity)
- **UseCase** suffix for use cases (e.g., GetUserUseCase)
- **Failure** suffix for failures (e.g., UserFailure)
- **Interface** starts with **I** prefix (e.g., IUserRepository)
- **Repository** suffix for repositories (e.g., UserRepository)
- **Page** suffix for screens (e.g., HomePage)
- **Controller** suffix for controllers (e.g., HomeController)

### Methods

- lowerCammelCase
- Verbs

### Variables

- lowerCammelCase
- Nouns

### Enums

- CammelCase
- **Enum** suffix for enums (e.g., UserRoleEnum)

### Tests

- **Test** suffix for test files (e.g., user_repository_test.dart)
- snake_case


## References

- [Clean Architecture: A Craftsman's Guide to Software Structure and Design](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutterando Clean Dart](https://github.com/Flutterando/Clean-Dart)
