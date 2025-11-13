# 🎮 Tic Tac Toe Game

A feature-rich Flutter application of the classic Tic Tac Toe game with multiple game modes and engaging UI.

## 📱 Overview

This is a modern Flutter implementation of the classic Tic Tac Toe game. The application provides an intuitive user interface with beautiful gradients and animations. Players can enjoy the game in two different modes: compete with a friend on the same device or challenge the computer AI.

## ✨ Features

- 🎯 **Two Game Modes**
  - Play With Friend: Local multiplayer mode for two players
  - Play With Computer: Single player mode against AI opponent

- 🎨 **Modern UI Design**
  - Beautiful gradient backgrounds
  - Smooth animations and transitions
  - Material Design components
  - Responsive layout for different screen sizes

- 🏆 **Game Logic**
  - Real-time win detection
  - Draw/Tie detection
  - Turn-based gameplay
  - Score tracking
  - Game reset functionality

- 🎯 **Custom Assets**
  - Animated GIF loader
  - Custom app icons for Android and iOS
  - Image assets for enhanced UI

- 📱 **Multi-Platform Support**
  - Android
  - iOS
  - Web
  - Linux
  - macOS
  - Windows

## 📁 Project Structure

```bash
lib/
├── main.dart              # Application entry point
├── first_screen.dart      # Main menu/home screen
├── single.dart            # Single player vs computer game screen
├── multi_player.dart      # Multiplayer game screen
├── game_page_2.dart       # Alternative game page implementation
├── vs_computer.dart       # Computer AI logic
├── draw.dart              # Game board drawing/UI
└── winner.dart            # Winner screen and game results

assets/
└── images/
    └── tic_tac_toe_loader_.gif  # Animated GIF asset
```

## 🎮 Game Modes

### Play With Friend

- Two players take turns on the same device
- Player 1 (X) vs Player 2 (O)
- Real-time turn indication
- Win/Draw detection with results screen

### Play With Computer

- Single player vs AI opponent
- Computer player uses intelligent strategy
- Adjustable difficulty level
- Win/Draw/Loss tracking

## 🚀 Installation

### Prerequisites

- Flutter SDK (version >=3.0.6)
- Dart SDK
- Android Studio / Xcode (for mobile development)

### Setup Instructions

1. **Clone the repository**

   ```bash
   git clone https://github.com/jAmikA78/TIC-TAC-TOE-GAME.git
   cd tic_tac_toe
   ```

2. **Get dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```

## 📖 Usage

1. **Launch the Application**
   - Open the app to see the main menu with a welcome message and animated logo

2. **Select Game Mode**
   - Click "Play With Friend" for local multiplayer
   - Click "Play With Computer" to play against AI

3. **Playing the Game**
   - Tap on an empty cell to place your mark
   - Players alternate turns automatically
   - The game detects wins or draws automatically

4. **View Results**
   - After game completion, see the winner or draw result
   - Option to start a new game or return to menu

## 🛠️ Technologies Used

- **Flutter** - UI Framework
- **Dart** - Programming Language
- **Material Design** - UI Components
- **Cupertino Icons** - iOS Style Icons
- **Flutter Launcher Icons** - App Icon Generation

### Key Dependencies

```yaml
flutter:
  sdk: flutter
cupertino_icons: ^1.0.2
icons_launcher: ^2.1.3
```

### Dev Dependencies

```yaml
flutter_test:
  sdk: flutter
flutter_launcher_icons: ^0.13.1
flutter_lints: ^2.0.0
```

## 🎨 Customization

### Changing Colors

Edit the color values in the respective `.dart` files:

- Primary gradient colors can be modified in `first_screen.dart`
- AppBar colors are configurable in the Material AppBar widget

### Adding Custom Fonts

Place font files in the `fonts/` directory and update `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: YourFont
      fonts:
        - asset: fonts/YourFont-Regular.ttf
```

### Modifying Game Rules

- AI logic can be enhanced in `vs_computer.dart`
- Win condition logic is in `draw.dart`

## 🧪 Testing

To run tests:

```bash
flutter test
```

Test file location: `test/widget_test.dart`

## 🔨 Building

### Android

```bash
flutter build apk
flutter build appbundle
```

### iOS

```bash
flutter build ios
```

### Web

```bash
flutter build web
```

## 📝 Code Style

The project follows Dart conventions:

- Camel case for variables and functions
- PascalCase for classes
- Meaningful variable names
- Comments for complex logic

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

MIT License

## 🙏 Acknowledgments

- Flutter documentation and community
- Material Design guidelines
- Contributors and testers

---

**Happy Gaming! 🎉**

Feel free to reach out with suggestions, bug reports, or feature requests!
