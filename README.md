# Shopping 🛒 — Shopping App

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=flat&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=flat&logo=dart&logoColor=white)
![State Management](https://img.shields.io/badge/State-BLoC-4CAF50)
![Networking](https://img.shields.io/badge/Networking-Dio-blue)
![License](https://img.shields.io/badge/License-Unlicensed-lightgrey)

A shopping app built with Flutter. It loads products from a REST API and uses BLoC for state management.

---

## 📱 Features

| Area | Description |
|---|---|
| **Products** | Fetch and display products from a REST API |
| **State Management** | Predictable UI states (loading, success, error) with BLoC |
| **Networking** | API requests handled with Dio |

## 🛠️ Tech Stack

| Category | Technology |
|---|---|
| Framework | Flutter (Dart SDK `>=3.0.0 <4.0.0`) |
| State Management | `flutter_bloc` |
| Networking | `dio` |
| UI | `cupertino_icons`, Material Design |

## 📂 Project Structure

<details>
<summary>View folder structure</summary>

```
shopping/
├── android/        # Android platform code
├── ios/            # iOS platform code
├── web/            # Web platform code
├── lib/            # Application source code
├── test/           # Unit tests
└── pubspec.yaml    # Dependencies & configuration
```

</details>

## Getting Started

```bash
# Clone the repository
git clone https://github.com/22ousefmostafa/shopping.git
cd shopping

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## Author

Built by [Youssef Mostafa](https://github.com/22ousefmostafa).

## License

This project is currently unlicensed.
