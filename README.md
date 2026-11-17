<p align="center">
  <img src="https://github.com/user-attachments/assets/a9383409-978d-437a-985e-76484cd024b1" width="120" alt="Journali app icon">
</p>

<h1 align="center">Journali</h1>

<p align="center"><i>Your thoughts, your story.</i></p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/3464ce8c-f56c-430b-ad79-1a2fc7f109aa" width="100%" alt="Journali app preview">
</p>

Journali is a personal journaling app for iPhone. It lets users write down their thoughts and experiences, then easily find, organize, and revisit them later.

---

## ✨ Main Features

In the current build, users can:

- **Write a new journal** with a title and content. The entry date is added automatically.
- **Edit a journal** by tapping its card.
- **Discard or keep changes** when closing the editor with unsaved edits.
- **Delete a journal** by swiping its card, with a confirmation before deleting.
- **Bookmark journals** to mark favorite or important entries.
- **Filter journals** to show bookmarked entries only, or show all entries sorted by date.
- **Search journals** for any word or phrase in the title or content.

---

## 🛠️ Technologies Used

- **Swift** and **SwiftUI**
- **MVVM** design pattern
- **Native Liquid Glass** through Apple's system components (toolbar, search bar, menus, and alerts)
- **System Dark Mode**
- **SF Symbols** for icons

### Project Structure (MVVM)

```
Journali/
├── Models/
│   └── Journal.swift
├── ViewModels/
│   └── JournalViewModel.swift
├── Views/
│   ├── SplashView.swift
│   ├── ContentView.swift
│   ├── JournalCardView.swift
│   └── JournalEditorView.swift
└── JournaliApp.swift
```
