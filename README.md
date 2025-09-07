# 🌱 Nurtur Mobile App

A comprehensive Flutter mobile application focused on nurturing and care, designed as part of a capstone project. This app provides a beautiful and intuitive user experience for users to engage with nurturing services and community features.

## 📱 Features

### 🔐 Authentication System
- **User Registration**: Complete signup flow with email verification
- **Secure Login**: Email/password authentication with "Remember Me" functionality
- **Password Recovery**: Forgot password with OTP verification and secure reset
- **Social Authentication**: Google Sign-In integration
- **User Profile**: Comprehensive user information management

### 🎨 User Interface
- **Modern Design**: Clean, Material Design-inspired interface
- **Custom Theming**: Consistent color scheme and typography using Google Fonts
- **Responsive Layout**: Optimized for various screen sizes and orientations
- **Welcome Experience**: Engaging onboarding flow for new users

### 🏗️ Architecture
- **Clean Architecture**: Separation of concerns with domain, data, and presentation layers
- **State Management**: Provider pattern for efficient state handling
- **Dependency Injection**: GetIt for clean dependency management
- **Modular Structure**: Feature-based organization for maintainability

## 🛠️ Technology Stack

### Frontend Framework
- **Flutter**: Cross-platform mobile development framework
- **Dart**: Programming language (SDK >=2.18.0 <4.0.0)

### State Management & Architecture
- **Provider**: State management solution
- **GetIt**: Dependency injection container
- **Clean Architecture**: Domain-driven design pattern

### Networking & Data
- **Dio**: HTTP client for API communication
- **JSON Serialization**: Automated JSON parsing with json_annotation
- **Shared Preferences**: Local data persistence
- **Cached Network Image**: Efficient image loading and caching

### UI & Design
- **Material Design**: Google's design system
- **Google Fonts**: Typography enhancement
- **Custom Theming**: Consistent visual identity

### Utilities
- **Connectivity Plus**: Network connectivity monitoring
- **Flutter Localizations**: Internationalization support

### Development Tools
- **Build Runner**: Code generation automation
- **Mockito**: Testing framework for mocking dependencies
- **Analysis Options**: Code quality and linting rules

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK**: Version 3.0 or higher
- **Dart SDK**: Version 2.18.0 or higher
- **Android Studio** or **VS Code** with Flutter extensions
- **Git**: For version control
- **Android SDK**: For Android development
- **Xcode**: For iOS development (macOS only)

## 🚀 Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/Nurtur-Capstone-Project/Nurtur-Mobile-2.git
cd Nurtur-Mobile-2
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Generate Code (if needed)
```bash
flutter packages pub run build_runner build
```

### 4. Run the Application
```bash
# For Android
flutter run

# For iOS
flutter run -d ios

# For a specific device
flutter devices  # List available devices
flutter run -d [device-id]
```

## 📁 Project Structure

```
lib/
├── 📄 main.dart                 # Application entry point
├── 📄 app.dart                  # App configuration
├── 📁 core/                     # Core utilities and constants
│   ├── 📄 constants.dart        # App-wide constants
│   └── 📄 di.dart              # Dependency injection setup
├── 📁 features/                 # Feature modules
│   └── 📁 auth/                # Authentication feature
│       ├── 📁 data/            # Data layer (repositories, models)
│       ├── 📁 domain/          # Business logic layer
│       └── 📁 presentation/    # UI layer (pages, widgets)
├── 📁 routes/                   # App routing configuration
├── 📁 screens/                  # Screen widgets
│   ├── 📄 welcome_screen.dart   # Welcome/onboarding screen
│   ├── 📄 login_screen.dart     # Login interface
│   ├── 📄 sign_up_screen.dart   # Registration interface
│   ├── 📄 forgot_password_*.dart # Password recovery flow
│   └── 📄 user_info_screen.dart # User profile management
├── 📁 shared/                   # Shared utilities and widgets
├── 📁 theme/                    # App theming and styling
│   └── 📄 app_theme.dart        # Theme configuration
└── 📁 widgets/                  # Reusable widget components
    └── 📄 login_form.dart       # Login form component

assets/
├── 📁 images/                   # Image assets
│   ├── 🖼️ hero.png             # Hero/splash images
│   ├── 🖼️ google.png           # Google branding
│   └── 🖼️ *.png                # Other UI images
├── 📁 icons/                    # Icon assets
└── 📁 fonts/                    # Custom fonts (if any)
```

## 🔧 Development Guidelines

### Code Style
- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use meaningful variable and function names
- Add documentation for public APIs
- Keep functions small and focused

### Architecture Principles
- **Separation of Concerns**: Each layer has a specific responsibility
- **Dependency Inversion**: Depend on abstractions, not concretions
- **Single Responsibility**: Each class should have one reason to change
- **Open/Closed Principle**: Open for extension, closed for modification

### Best Practices
- Use const constructors where possible for better performance
- Implement proper error handling and user feedback
- Write unit tests for business logic
- Use meaningful commit messages
- Keep dependencies up to date

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run integration tests
flutter drive --target=test_driver/app.dart
```

## 🚀 Building for Production

### Android
```bash
# Build APK
flutter build apk --release

# Build App Bundle (recommended for Play Store)
flutter build appbundle --release
```

### iOS
```bash
# Build for iOS
flutter build ios --release
```

## 🔐 Environment Configuration

Create environment-specific configuration files:

1. Create `lib/config/` directory
2. Add environment files for different stages (dev, staging, prod)
3. Configure API endpoints, keys, and other environment-specific values

## 🤝 Contributing

We welcome contributions to the Nurtur Mobile App! Please follow these guidelines:

### Getting Started
1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes following our coding standards
4. Write or update tests as needed
5. Commit your changes: `git commit -m 'Add amazing feature'`
6. Push to the branch: `git push origin feature/amazing-feature`
7. Open a Pull Request

### Pull Request Guidelines
- Provide a clear description of the changes
- Include screenshots for UI changes
- Ensure all tests pass
- Update documentation if needed
- Reference any related issues

### Code Review Process
1. All submissions require review before merging
2. Address any feedback promptly
3. Maintain code quality and consistency
4. Ensure backward compatibility

## 📄 License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

### GPL v3.0 Summary
- ✅ Commercial use allowed
- ✅ Modification allowed
- ✅ Distribution allowed
- ✅ Patent use allowed
- ✅ Private use allowed
- ❗ Must include license and copyright notice
- ❗ Must disclose source code
- ❗ Changes must be documented

## 👥 Team & Credits

This project is developed as part of the **Nurtur Capstone Project**.

### Acknowledgments
- Flutter team for the amazing framework
- Google Fonts for typography
- Material Design for UI guidelines
- Open source community for various packages

## 📞 Support & Contact

For support, questions, or feedback:

- 📧 Create an issue in this repository
- 💬 Join our discussions in the Issues section
- 📝 Check our documentation and FAQs

## 🔮 Future Enhancements

- [ ] Dark mode support
- [ ] Push notifications
- [ ] Offline mode capability
- [ ] Advanced user analytics
- [ ] Multi-language support expansion
- [ ] Accessibility improvements
- [ ] Performance optimizations

---

**Made with ❤️ using Flutter**

*This README is a living document. Please keep it updated as the project evolves.*