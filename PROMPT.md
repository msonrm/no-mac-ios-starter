# AI Prompts for iOS App Development

Use these prompts with your AI assistant (Claude, ChatGPT, Cursor, etc.) to build your app.

## Initial Setup Prompt

```
I'm building an iOS app using this project structure:

- project.yml (XcodeGen configuration)
- Sources/App/ - App entry point, services
- Sources/Views/ - SwiftUI views
- ShareExtension/ - Share Extension target

The app uses:
- SwiftUI
- Firebase (Auth, Realtime Database, Messaging)
- Google Sign-In

Please help me build [YOUR APP IDEA HERE].

First, review the project.yml and understand the structure, then start implementing.
```

## Feature Implementation Prompts

### Add a new View

```
Add a new SwiftUI view called [ViewName] in Sources/Views/.
It should [describe what the view does].
Follow the existing code style in the project.
```

### Add Firebase functionality

```
Implement [feature] using Firebase Realtime Database.
- Create a service in Sources/App/
- Add the necessary SwiftUI views
- Handle authentication state
```

### Implement Share Extension

```
Implement the Share Extension to receive [text/URL/image] from other apps.
- Handle the shared content in ShareExtension/
- Save it using Firebase
- Show confirmation to the user
```

## Debugging Prompts

```
The GitHub Actions build is failing with this error:
[paste error here]

How do I fix this?
```

```
The app crashes on launch with this error:
[paste error here]

What's wrong?
```

## Code Style Guidelines

When asking AI to write code:

1. Use SwiftUI (not UIKit)
2. Use async/await (not completion handlers)
3. Use @Observable (iOS 17+) or ObservableObject
4. Keep views simple - extract logic to services
5. Use environment for dependency injection

---

# 日本語プロンプト

## 最初のプロンプト

```
このプロジェクト構造でiOSアプリを作っています：

- project.yml (XcodeGen設定)
- Sources/App/ - アプリのエントリーポイント、サービス
- Sources/Views/ - SwiftUIビュー
- ShareExtension/ - Share Extension

使用技術：
- SwiftUI
- Firebase (Auth, Realtime Database, Messaging)
- Google Sign-In

[あなたのアプリのアイデア] を作りたいです。

まずproject.ymlを確認して構造を理解し、実装を始めてください。
```

## 機能追加

```
Sources/Views/ に [ビュー名] を追加してください。
[何をするビューか説明]
既存のコードスタイルに合わせてください。
```

## デバッグ

```
GitHub Actionsのビルドがこのエラーで失敗しています：
[エラーを貼り付け]

どう修正すればいいですか？
```
