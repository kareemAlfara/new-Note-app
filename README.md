📝 new‑Note‑app
A beautiful, simple, and powerful **note app** built using **Flutter**. This app helps you jot down thoughts, manage daily notes, and stay organized—all with a sleek, responsive UI and offline support.
**🔍 Table of Contents :**
#   - Features

#   - Screenshots

#   - Tech Stack
 
#   - Getting Started

#   - Project Structure

#   - License



## 🚀 Features

- 📝 Create, edit, and delete notes
- 🔍 Search and filter through notes
- 🕓 Sort by date created
- 💾 Offline access using local database (Hive)
- 🎨 Clean UI with responsive layout
- 📱 Supports Android & iOS
- 📱 Form validation and in-app notifications
-💾 Secure local storage (e.g. SharedPreferences )

---
## ScreenShots

| Home Screen | Create Note |
|-------------|-------------|
| ![DarkHome](assets/screenshots/Screenshot%202025-06-21%20235532.png) | ![lightHome](assets/screenshots/Screenshot%202025-06-21%20235555.png) | ![Create](assets/screenShots/Screenshot%202025-06-21%20235655.png) |
![editing](assets/screenshots/Screenshot%202025-06-21%20235619.png)


---
## 🧰 Tech Stack

- [Flutter](https://flutter.dev)
- [Hive](https://pub.dev/packages/hive)
- [Bloc](https://pub.dev/packages/flutter_bloc)
- [dio](https://pub.dev/packages/dio)
- [Dart](https://dart.dev)

---

## 🛠️ Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/kareemAlfara//new-Note-app.git
   cd NoteApp
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Generate Hive type adapters :
   ```bash
   flutter packages pub run build_runner build
   ```

4. Run the app:
   ```bash
   flutter run
   ```

---

## 📂 Folder Structure

```plaintext
lib/
├── data/            # Data layer (models, Hive, repositories)
├── domain/          # Business logic (entities, usecases)
└── presentation/    # UI (screens, widgets, state management)
└── main.dart                # App entry point
```



## 👤 Author

- [Kareem Alfarra](https://github.com/kareemAlfara/)
- LinkedIn: [linkedin.com/in/kareem-elfara](https://www.linkedin.com/in/kareem-elfara-2aa767337/)

---
