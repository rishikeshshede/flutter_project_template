## App features

This folder contains all the features of the app, organized following the Clean Architecture principles in the structure detailed below.

```plaintext
|---/features
    |---/feature_name
        |---/bindings               # Dependency injection for the feature
        |---/data                   # Handles data fetching and storage
            |---/dtos               # DTOs (Data Transfer Objects) for API responses
            |---/sources            # Remote data sources (API calls)
            |---/implementations    # Implementations of domain interfaces
            |---/mappers            # Mappers to convert data formats
        |---/domain
            |---/models             # Domain models
            |---/interfaces         # Defines domain interfaces
            |---/usecases           # Business logic use cases
        |---/presentation           # UI and controllers for the feature
            |---/controllers
            |---/screens
            |---/widgets
```

## 💡 Tip:

You don't have to create all the folders and files for each feature manually. Use the `create_feature.sh` file inside scripts folder in the root directory.

Note: From the root of your project, run below commands.

First, provide execution permission to the script:

```sh
chmod +x scripts/create_feature.sh
```

Then, create feature:

```sh
./scripts/create_feature.sh feature_name
```
