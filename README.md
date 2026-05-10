# 🏀 NBA 2026 — SwiftUI App

一款以 **SwiftUI** 開發的 NBA 資訊應用程式，涵蓋球隊介紹、球員數據、季後賽對戰表等功能，提供沉浸式的 NBA 視覺體驗。

---

## 📱 功能總覽

| 頁面 | 功能說明 |
|------|----------|
| 🏠 Home | 首頁入口，跳轉至聯盟簡介或 NBA 官網 |
| 📋 Introduction | NBA 歷史、聯盟結構與熱門球星介紹 |
| 👥 Team | 30 支 NBA 球隊列表，點擊可查看球隊詳情 |
| ⭐ Stats | 得分、助攻、籃板、阻攻四項數據排行榜 |
| 🏆 Playoff | 2024 NBA 季後賽對戰賽程表（含最終冠軍） |

---

## 🗂️ 程式碼結構

```
NBA-App/
├── ebookApp.swift          # App 進入點
├── ContentView.swift       # 主 TabView 導覽
├── HomePageView.swift      # 首頁
├── IntroPageView.swift     # NBA 簡介頁
├── TeamListView.swift      # 球隊列表與詳情頁
├── StatsView.swift         # 數據排行榜
└── BracketView.swift       # 季後賽對戰表
```

---

## 🧩 各檔案說明

### `ebookApp.swift`
App 的主入口（`@main`），啟動 `ContentView` 作為根視圖。

---

### `ContentView.swift`
使用 `TabView` 組合四個主要頁面，底部導覽列 Tab 依序為：

- **Home**（basketball 圖示）
- **Team**（person.fill 圖示）
- **Stats**（star.fill 圖示）
- **Playoff**（figure.mixed.cardio 圖示）

---

### `HomePageView.swift`
首頁視覺設計，包含：

- 背景 `airjordan` 全螢幕圖片
- NBA Logo 浮層
- `NavigationLink` 跳轉至 `IntroPageView`
- `NavigationLink` 搭配 `WebView`（`WKWebView` 封裝）開啟 [nba.com](https://www.nba.com)

**自定義元件：**
- `WebView` — `UIViewRepresentable` 封裝 WKWebView，支援任意 URL 載入

---

### `IntroPageView.swift`
NBA 簡介頁，包含：

- 頂部球場橫幅圖片（`nba_stadium`）
- 聯盟基本介紹文字區塊（`SectionView`）
- 水平滑動的熱門球星卡片（`ScrollView(.horizontal)`）
- 球員資料由 `Player` 結構與 `players` 陣列定義

**自定義元件：**

| 元件 | 說明 |
|------|------|
| `PlayerCardView` | 球員照片卡片，含漸層遮罩與隊伍標籤 |
| `SectionView` | 統一樣式的內容文字區塊 |
| `Player` | 球員資料結構（名稱、球隊、圖片、代表色） |

**預設球員資料：**
- LeBron James（Lakers）
- Stephen Curry（Warriors）
- Kevin Durant（Suns）
- Luka Doncic（Mavericks）
- Giannis Antetokounmpo（Bucks）

---

### `TeamListView.swift`
30 支 NBA 球隊完整列表，分為東區、西區。點擊球隊跳轉至 `TeamDetailView`。

**資料模型：**
```swift
struct Team: Identifiable {
    let name: String
    let city: String
    let conference: String   // "Eastern" / "Western"
    let championships: Int
    let description: String
    let color: Color
    let logoImage: String    // Assets 中的圖片名稱（1～30）
}
```

**自定義元件：**

| 元件 | 說明 |
|------|------|
| `TeamListView` | 球隊列表主頁，透明背景 List |
| `TeamDetailView` | 球隊詳情頁，含分區、冠軍次數、球隊簡介 |
| `InfoBox` | 小型資訊卡片元件 |

---

### `StatsView.swift`
四項球員數據排行榜，以 `Picker`（`.segmented` 樣式）切換類別。

**資料類別：**

| 類別 | 單位 | 說明 |
|------|------|------|
| 得分 | PPG | Points Per Game |
| 助攻 | APG | Assists Per Game |
| 籃板 | RPG | Rebounds Per Game |
| 阻攻 | BPG | Blocks Per Game |

**資料模型：**
```swift
struct PlayerStats: Identifiable {
    let name: String
    let team: String
    let value: Double
    let imageName: String
    let rank: Int
}
```

**自定義元件：**
- `LeaderRow` — 排行榜每列，含名次、球員照片、姓名球隊、數據數值

---

### `BracketView.swift`
2024 NBA 季後賽完整對戰表，以 `ScrollView([.horizontal, .vertical])` 呈現橫向賽程結構。

**賽程結構（左→右）：**
```
西區首輪 → 西區準決賽 → 西區決賽 → NBA Finals ← 東區決賽 ← 東區準決賽 ← 東區首輪
```

**總冠軍：** 🏆 Boston Celtics（4:1 擊敗 Mavericks）

**自定義元件：**
- `MatchupBox` — 通用對戰框，以橘色高亮顯示勝隊，支援可調整寬度

---

## 🎨 設計風格

- **深色主題**：全域採用深色背景搭配半透明遮罩
- **全幅背景圖**：各頁面使用主題圖片（`playoff`、`court`、`100point`、`teamwallpaper`）
- **橘色強調色**：勝隊高亮、排名數字、數據標籤統一使用 `.orange`
- **圓角卡片設計**：List Row、MatchupBox 均使用圓角與描邊樣式

---

## 🔧 開發環境

| 項目 | 版本 |
|------|------|
| 語言 | Swift 5.9+ |
| UI 框架 | SwiftUI |
| 最低支援 | iOS 16.0+ |
| IDE | Xcode 15+ |
| 額外框架 | WebKit（WKWebView） |

---

## 📦 Assets 資源清單

| 類型 | 名稱 |
|------|------|
| 背景圖 | `airjordan`, `court`, `playoff`, `100point`, `teamwallpaper`, `nba_stadium` |
| Logo | `nbalogo` |
| 球員照片 | `lebron`, `stephen`, `kevin`, `777`（Luka）, `666`（Giannis）, `luka`, `shai`, `giannis`, `tyrese`, `trae`, `sabonis`, `gobert`, `ad`, `wemby`, `kessler`, `lopez` |
| 球隊隊徽 | `1` ～ `30`（對應 nbaTeams 陣列順序） |
| 按鈕圖 | `basketballbutton` |

---

成果展示：https://youtu.be/ESz1DXO0AoY?si=YgUKwnjul0YoG4qb

## 👨‍💻 開發者

- 開發時間：2026/5/10
- 課程：iOS程式設計
