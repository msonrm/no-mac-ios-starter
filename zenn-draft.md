---
title: "Mac不要でiOSアプリをTestFlightに出すテンプレート"
emoji: "🎄"
type: "tech"
topics: ["ios", "swiftui", "githubactions", "xcodegen", "fastlane"]
published: false
---

## これは何

Mac実機なしでiOSアプリをTestFlightまで出せるGitHubテンプレート。

https://github.com/msonrm/no-mac-ios-starter

## 特徴

- ピュアSwiftUI（Expoではない）
- Share Extension対応
- GitHub Actionsだけで完結
- ビルド番号自動インクリメント

## 必要なもの

- Apple Developer Program（年12,800円）
- GitHubアカウント
- Firebaseプロジェクト
- AIアシスタント（Claude、ChatGPT等）

Macは不要。

## 使い方

1. 「Use this template」でリポジトリ作成
2. GitHub Secretsを設定
3. AIにコードを書かせる
4. Push
5. ワークフロー実行 → TestFlight

## GitHub Secrets

| Secret | 内容 |
|--------|------|
| `APPLE_ID` | Apple ID |
| `TEAM_ID` | Team ID |
| `KEYCHAIN_PASSWORD` | 任意のパスワード |
| `MATCH_PASSWORD` | 証明書暗号化パスワード |
| `MATCH_GIT_PRIVATE_KEY` | 証明書リポジトリ用SSH鍵 |
| `APP_STORE_CONNECT_API_KEY_KEY_ID` | API Key ID |
| `APP_STORE_CONNECT_API_KEY_ISSUER_ID` | Issuer ID |
| `APP_STORE_CONNECT_API_KEY_KEY` | Base64エンコードした.p8 |

詳細はREADME参照。

## ライセンス

MIT。

## サポート

なし。as-is。
