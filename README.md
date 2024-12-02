# Flutter Project Template

Welcome to the **Flutter Project Template**! This template helps you quickly set up your new Flutter project with just one command. You no longer need to worry about creating new files and folder structures every time you start a new project. This template includes essential utilities, network services, constants, environment file setup, and Clean Architecture and many more things, all ready for your desired platforms. Focus on writing your app code, not on project setup!

## 💡 What It Does?

- **Creates a New Flutter Project**: Generates a new Flutter project with a customizable name.
- **Automatic Setup**: Automatically copies all the necessary setup files from this template to your new project, saving you time.
- **Imports Essential Packages**: Adds basic essential packages required for most Flutter projects.
- **Customizable**: Easily adaptable for your specific project needs and architecture.

## ✅ Features

- **Production-Ready Setup**: Provides a robust, production-quality project structure and setup.
- **Automations**: Includes several time-saving automation scripts to streamline tasks like:
  - Building APKs and placing them in an easily accessible location.
  - Setting up a Flutter project with just one command.
  - Automatically creating a folder and file structure for each feature using **Clean Architecture**.
  - Handling environment file setup and configuration.
  - Managing dependencies in `pubspec.yaml`.
- **Centralized Routing**: Simplified, centralized routing management for your app’s navigation.
- **Centralized Logging**: Easy-to-manage logging system for your app's runtime events.
- **Network Service Integration**: Pre-configured network service to handle API calls and interactions.
- **Customizable Themes**: Set up and configure themes for your app in a centralized location.
- **Helpful Utilities**: Includes various utility functions for common tasks (e.g., date formatting, responsive UI, validation, etc.).

This structure should make it easier to understand the benefits and features of using this template for new Flutter projects. Let me know if you need more changes!

## ❓ How to Use:

### Step-by-Step Setup:

1. Visit [GitHub repository](#).
2. Download the ZIP of this `flutter_project_template` repository and extract it.
3. Copy the extracted folder to the directory where you want to create your new Flutter project.
4. Open a terminal in this copied `flutter_project_template` directory.
5. Grant execution permission to the setup script by running the following command:

   ```sh
   chmod +x scripts/setup_flutter_project.sh
   ```

6. Now, run the setup script with the desired project name:

   ```sh
   ./scripts/setup_flutter_project.sh new_project_name
   ```

7. (Optional) Add the `-d` flag if you want this template folder to be deleted after creating your new project:

   ```sh
   ./scripts/setup_flutter_project.sh new_project_name -d
   ```

8. Run the app.

9. Customize the files as needed and start coding!

## 🗂️ Project Structure

Here’s an overview of the folder structure created using Clean Architecture and best practices:

```plaintext
/flutter_project_template
|---.env                                # Stores app's secrets
|---/apks                               # Stores .apk files created using build_apk.sh script
|---/assets                             # UI assets (fonts, icons, images)
    |---/fonts
    |---/icons
    |---/images
|---/lib
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
    |---/routes                          # App routing setup
    |---/themes                          # UI themes and design
    |---/services                        # API and backend services
    |---/utils                           # Helper functions and constants
    |---/widgets                         # Reusable global widgets
    |---main.dart
|---/scripts                             # Useful automation scripts
|---/test                                # Unit and widget tests
    |---/features
        |---/feature_name
            |---data
            |---domain
            |---presentation
    |---/utils
    |---/core
    |---/integration_tests
    |---/mocks
    |---test_helpers.dart
```

You don't have to waste your time creating all the folders and files for each feature manually. Use the `create_feature.sh` file inside scripts folder in the root directory.

First, provide execution permission to the script:

```sh
chmod +x scripts/create_feature.sh
```

Then, create feature:

```sh
./scipts/create_feature.sh feature_name
```

## 🌍 Get Involved

Want to contribute? Feel free to:

1. Fork the repo.
2. Create a new branch for your enhancement or fix.
3. Submit a pull request.

🌟 Star the Repository

## 🤝 Stay Connected

Follow me and share your feedback!

- **YouTube**: [https://www.youtube.com/@RishikeshShede](#)
- **Instagram**: [https://www.instagram.com/rishikeshshede/](#)
