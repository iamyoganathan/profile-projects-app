# Profile & Projects App

A Flutter application demonstrating basic Flutter concepts including TabBar navigation, state management, and UI components.

## 👨‍💻 Developer Information

**Name:** Yoganathan C  
**Intern ID:** MT1286  
**Company:** Maincrafts Technology  
**Domain:** Flutter App Development  
**Internship Duration:** 12 Weeks (07 Dec 2025 - 07 Apr 2026)

## 📱 About The App

This is Task 1 of the MainCrafts Internship program. The app is a profile and project management application with two main tabs:

- **Profile Tab**: Displays personal information, bio, contact details, and internship information
- **Projects Tab**: Shows a list of projects with the ability to add new ones dynamically

## ✨ Features

- ✅ Tab-based navigation using `TabBar` and `TabBarView`
- ✅ Profile section with personal details and internship information
- ✅ Projects section displaying project cards using `ListView`
- ✅ Floating Action Button to add new projects
- ✅ Dialog for adding project details
- ✅ Simple state management using `setState`
- ✅ Responsive and clean UI with Material Design
- ✅ Card widgets for organized content display

## 🛠️ Technologies & Concepts Used

- **Flutter SDK**: 3.35.3
- **Dart**: 3.9.2
- **Widgets**: Scaffold, AppBar, TabBar, TabBarView, ListView, Card, Dialog
- **State Management**: `setState` (StatefulWidget)
- **Layouts**: Column, Row, Padding, Container, SingleChildScrollView
- **Material Design**: Material 3 theming

## 📂 Project Structure

```
profile_projects_app/
├── lib/
│   └── main.dart          # Main application code
├── android/               # Android-specific files
├── ios/                   # iOS-specific files
├── web/                   # Web-specific files
├── pubspec.yaml          # Dependencies and assets
└── README.md             # Project documentation
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed (version 3.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- Android Emulator / iOS Simulator / Physical Device

### Installation & Running

1. **Clone or download this repository**

2. **Navigate to the project directory**
   ```bash
   cd profile_projects_app
   ```

3. **Get dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

5. **For specific platform:**
   ```bash
   # Android
   flutter run -d android
   
   # iOS (macOS only)
   flutter run -d ios
   
   # Web
   flutter run -d chrome
   ```

## 📸 Screenshots

### Profile Tab
- Displays profile picture (icon)
- Name: Yoganathan C
- Intern ID: MT1286
- Bio section with personal description
- Contact information (email, phone, location)
- Internship details (domain, duration, dates)

### Projects Tab
- Lists all projects in card format
- Shows project title and description
- Empty state message when no projects exist
- Add button to create new projects

### Add Project Dialog
- Input fields for project title and description
- Cancel and Add buttons
- Form validation

## 🔧 Building APK

To build an APK for Android:

```bash
flutter build apk --release
```

The APK will be located at: `build/app/outputs/flutter-apk/app-release.apk`

## 🌐 Web Deployment

To build for web:

```bash
flutter build web
```

The web build will be in the `build/web/` directory.

## 📋 Task Deliverables

✅ **GitHub Repository**: Complete Flutter project with source code  
✅ **README File**: Comprehensive documentation  
✅ **APK Build**: Can be generated using `flutter build apk`  
✅ **Screenshots**: Can be captured from running app  
✅ **All Requirements Met**:
  - TabBar with two tabs (Profile & Projects)
  - Profile tab with photo, bio, and contact
  - Projects tab with project cards using ListView
  - Floating Action Button
  - Add project dialog
  - Simple state management using setState

## 🎯 Skills Demonstrated

- Setting up Flutter SDK and creating projects
- Using widgets: `ListView`, `Card`, `TabBar`, `Dialog`
- Implementing TabController for navigation
- Managing state with `setState`
- Organizing project structure and assets
- Building responsive layouts
- Material Design implementation

## 📝 Future Enhancements

- Add local storage using SharedPreferences or Hive
- Implement project deletion functionality
- Add edit project feature
- Include image picker for profile photo
- Add more profile fields
- Implement search functionality for projects
- Add project categories and filters

## 🤝 Contributing

This is an internship task project. For any suggestions or improvements, feel free to reach out.

## 📄 License

This project is created as part of the MainCrafts Technology internship program.

## 📞 Contact

**Yoganathan C**  
Email: yoganathan@example.com  
LinkedIn: [Connect on LinkedIn](https://www.linkedin.com)

---

**MainCrafts Technology**  
Website: www.maincrafts.com  
Email: hr@maincrafts.com  
MSME NO: UDYAM-UP-75009604

---

*Developed as Task 1 for MainCrafts Technology Flutter App Development Internship*
