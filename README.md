# Stock-Info App

個股基本面分析 Flutter App，支援 Android 與 iOS。

## 功能

- 搜尋股票（台股、美股、港股）
- 個股基本面分析（EPS、P/E、ROE、殖利率等）
- 價格走勢圖（多種時間區間）
- AI 智能諮詢（由 Claude 驅動）
- Firebase Google 登入

## 系統需求

| 項目 | 需求 |
|---|---|
| Flutter | 3.0.0 以上 |
| Dart | 3.0.0 以上 |
| Android SDK | 21 以上 |
| iOS | 12.0 以上 |

## 安裝方式

### 方法一：使用安裝腳本（Windows，推薦）

```powershell
git clone https://github.com/RoyZeng0317/Stock-Info_App.git
cd Stock-Info_App
.\install.ps1
```

### 方法二：手動安裝

```bash
# 1. Clone 專案
git clone https://github.com/RoyZeng0317/Stock-Info_App.git
cd Stock-Info_App/stocks

# 2. 安裝套件
flutter pub get

# 3. 執行 App
flutter run
```

## 執行 App

```bash
cd Stock-Info_App/stocks

# 執行在預設裝置
flutter run

# 列出可用裝置
flutter devices

# 指定裝置執行
flutter run -d <device_id>

# 建置 Android APK
flutter build apk --release

# 建置 iOS（需要 Mac）
flutter build ios --release
```

## 專案結構

```
stocks/
├── lib/
│   ├── main.dart              # 進入點
│   ├── app_router.dart        # 路由設定
│   ├── theme/
│   │   └── app_theme.dart     # 深色主題
│   ├── models/
│   │   └── stock.dart         # 資料模型
│   ├── services/
│   │   ├── api_service.dart   # API 呼叫
│   │   └── auth_service.dart  # Firebase Auth
│   ├── screens/
│   │   ├── home_screen.dart   # 首頁（搜尋）
│   │   └── stock_screen.dart  # 個股頁
│   └── widgets/
│       ├── stock_header.dart       # 股價標題
│       ├── fundamentals_card.dart  # 基本面卡片
│       ├── price_chart_widget.dart # 價格圖表
│       └── ai_consult_widget.dart  # AI 諮詢
└── pubspec.yaml
```

## 後端 API

App 連接至部署在 Render 的 FastAPI 後端：

```
https://stock-info-backend-z6sr.onrender.com/api
```

> 注意：後端使用 Render 免費方案，首次請求可能需要等待 30～60 秒冷啟動。

## 常見問題

**Q: `flutter run` 出現套件找不到的錯誤**

```bash
flutter clean
flutter pub get
flutter run
```

**Q: Android 裝置沒有出現**

確認已開啟手機的「開發人員選項」與「USB 偵錯」。

**Q: App 一直在載入**

後端可能正在冷啟動，請等待 30～60 秒後重試。
