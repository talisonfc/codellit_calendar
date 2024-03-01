## Codelitt Calendar UI

One-page application for managing reminders. The calendar shows which days have reminders. When the user clicks on a day, all reminders for that day are loaded and the app shows a list of reminders. The user can update any information about the reminder or create a new one.

To see a demo click [here](http://codelitt-calendar-ui.s3-website-sa-east-1.amazonaws.com/).

### Technical details

To fully exploit the Flutter Api, no external packages were used other than http. Http was important because it is recommended by the flutter documentation for making http requests. With this, the state management strategy used was the application state with InheritedWidget on top, tracking the internal state of the entire application.

### Architecture

I used clean architecture principles to design the calendar with the following layers::
- **presenter**: responsible for the user interface. The presenter has a page to describe a screen, a controller to manage actions and states.
- **domain**: responsable for business rules. The was divided into *entities*, *usecases* and *datasources*. Entities encapsulate data and business rules related to validation and data structure for persistence. Usecases deal with actions such as read, save, delete, and update. The datasource in the internal domain is just the interface with the contracts that the persistence layer should provide.
- **data**: responsible for fetching and sending data through the API. This layer implements all external operations with API.

The E2e test was implemented with simulated data. To simulate responses, the IApiClient interface accepts a MockResponse parameter where it is possible to inject data that the data source will use to respond in mock mode. The ApiClient implementation use an env variable called **MOCK_ENABLED** to enable mock mode. Mock mode is used by ApiClient to generate reponses with mock instead of make real requests to api.

The **core** package has implementations that isn't related directly with the application domain.
- **ds**: design system following the principle of atomic design. For this implementation, this package was only divided into atoms, molecules and theme, but there are organisms and templates for complex UI components.
- **shared**: general resources, like calendar generator and ApiClient.

Despite not having used any dependency injection package, this principle was applied, creating interfaces for usecases, datasources, and http client (IApiClient). Dependency injection was performed in the main class of the system.

### What's next?

Some changes can be made to improve the code, such as:
- Use a better approach for state management, like reactive variables with GetX.
- Increase code coverage by implementing unit tests for usecases and datasources using a mock package.
- Implement more end-to-end (e2e) tests to verify editing behavior.
- Define the design using color schema variables to simplify the implementation of the color management API.

---
### How to run?

Use the following command to run:

```
flutter run -d chrome --dart-define-from-file=.env
```

---
### E2e tests

To run e2e tests, first initialize a instance of chromedriver in a isolate terminal with command `chromedriver --port=4444`. After that, run `flutter drive` to start up tests:

```
flutter drive --driver=test_driver/integration_test.dart --target=integration_test/calendar_test.dart -d chrome --dart-define=MOCK_ENABLED=true
```