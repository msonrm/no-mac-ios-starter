# no-mac-ios-starter 🎄

**Ship your iOS app to TestFlight without owning a Mac.**

Pure SwiftUI. Native extensions. GitHub Actions only.

> 🇯🇵 [日本語はこちら](#日本語)

## What's this?

A complete CI/CD template for building and deploying iOS apps using only GitHub Actions.

- ✅ No Mac required
- ✅ Pure SwiftUI (not Expo/React Native)
- ✅ Share Extension supported
- ✅ Automatic build number increment
- ✅ TestFlight deployment

## Requirements

- Apple Developer Program ($99/year)
- GitHub account
- Firebase project (free tier is fine)
- AI assistant (Claude, ChatGPT, Cursor, etc.)

That's it. No Mac needed.

## Quick Start

1. Click **"Use this template"** → Create your repository
2. Set up [GitHub Secrets](#github-secrets)
3. Let AI write your app code (see [PROMPT.md](PROMPT.md))
4. Push to `main`
5. Run the workflow → TestFlight 🚀

## GitHub Secrets

Set these in your repository: `Settings` → `Secrets and variables` → `Actions`

| Secret | Description |
|--------|-------------|
| `APPLE_ID` | Your Apple ID email |
| `TEAM_ID` | Apple Developer Team ID (10 characters) |
| `KEYCHAIN_PASSWORD` | Any password (for CI keychain) |
| `MATCH_PASSWORD` | Password to encrypt certificates |
| `MATCH_GIT_PRIVATE_KEY` | SSH private key for certificates repo |
| `APP_STORE_CONNECT_API_KEY_KEY_ID` | App Store Connect API Key ID |
| `APP_STORE_CONNECT_API_KEY_ISSUER_ID` | Issuer ID |
| `APP_STORE_CONNECT_API_KEY_KEY` | Base64-encoded .p8 file |

### How to get these values

<details>
<summary>TEAM_ID</summary>

1. Go to [Apple Developer](https://developer.apple.com/account)
2. Membership → Team ID

</details>

<details>
<summary>App Store Connect API Key</summary>

1. Go to [App Store Connect](https://appstoreconnect.apple.com/) → Users and Access → Integrations → App Store Connect API
2. Generate API Key (Admin role)
3. Download `.p8` file
4. Note the Key ID and Issuer ID
5. Base64 encode the .p8 file:
   ```bash
   base64 -i AuthKey_XXXXXX.p8 | tr -d '\n'
   ```

</details>

<details>
<summary>MATCH_GIT_PRIVATE_KEY</summary>

1. Create a **private** repository for certificates (e.g., `your-username/certificates`)
2. Generate SSH key:
   ```bash
   ssh-keygen -t ed25519 -C "match" -f match_key
   ```
3. Add `match_key.pub` as Deploy Key to certificates repo (with write access)
4. Use `match_key` content as this secret

</details>

## Project Structure

```
├── Sources/
│   ├── App/           # App entry point, services
│   └── Views/         # SwiftUI views
├── ShareExtension/    # Share Extension target
├── project.yml        # XcodeGen configuration
├── fastlane/          # Deployment automation
└── .github/workflows/ # CI/CD pipelines
```

## Customization

1. Edit `project.yml`:
   - Change `name` to your app name
   - Update `bundleIdPrefix` to your domain (reverse)

2. Edit `fastlane/Matchfile`:
   - Update `git_url` to your certificates repository

3. Replace `GoogleService-Info.plist` with yours from Firebase Console

4. Add your app icon:
   - Place a 1024x1024 PNG as `AppIcon.png` in the project root
   - The workflow will auto-generate all required sizes

## Workflows

| Workflow | Trigger | Description |
|----------|---------|-------------|
| `build.yml` | Manual | Build check (no signing) |
| `setup-certificates.yml` | Manual (once) | Generate certificates |
| `deploy.yml` | Manual | Build & deploy to TestFlight |

## Support

**None.** This is provided as-is. No issues, no PRs, no questions.

You're a developer. Figure it out.

## License

MIT License - see [LICENSE](LICENSE)

---

# 日本語

## これは何？

**Mac実機なしでTestFlightまで完走できるiOSアプリ開発キット。**

Zenn読者へのクリスマスプレゼント。🎄

- Expoじゃない。ピュアSwiftUI。
- Share Extensionも使える。
- GitHub Actionsだけで完結。

## 必要なもの

- Apple Developer Program（年12,800円）
- GitHubアカウント
- Firebaseプロジェクト（無料枠でOK）
- AIアシスタント（Claude、ChatGPT、Cursorなど）

Macは不要。

## 使い方

1. 「Use this template」でリポジトリ作成
2. GitHub Secretsを設定
3. AIにアプリのコードを書かせる（[PROMPT.md](PROMPT.md)参照）
4. Push → TestFlight 🚀

## サポート

受け付けてません。使い方は、生成AIにきけばなんとかなります。

---

Made with ☕ by [@msonrm](https://github.com/msonrm)
