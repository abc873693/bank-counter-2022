# Bank Counter

使用 Flutter 開發模擬銀行抽號碼牌 App

展示網頁: [網址](https://abc873693.github.io/bank-counter-2022/#/)

## 建置環境

- Flutter 穩定版本 `3.3.4`
- Android SDK version 33.0.0
- Xcode 13.4.1
- IDE: Android Studio (version 2021.3)

## 如何開始

### 1. 至官網安裝 [Flutter](https://flutter.dev/docs/get-started/install) 以及設定對應平台所需的工具

安裝好後須確認是否已全數安裝完畢

``` bash
$ flutter doctor -v
```

### 2. 確認可使用的裝置

```bash
$ flutter devices                                                           
4 connected devices:

Pixel 5 (mobile) • {debice-id} • android-arm64  • Android 13 (API 30)
iPad (mobile) • {debice-id} • ios            • iPadOS 15.6
Chrome (web)     • chrome         • web-javascript • Google Chrome 105.0.5195.125
```

### 3. 執行對應平台

Android

```bash
$ flutter run -d {debice-id}
```

iOS

```bash
$ flutter run -d {debice-id}
```

Web

```bash
$ flutter run -d chrome
```

## 如何修改銀行行員成員設定

### 1. 至 `lib/app.dart` 行數 `5` 此設定常量列表 `_counterList`

```
5  const List<BankCounterModel> _counterList = <BankCounterModel>[
6    BankCounterModel('Amy'),
7    BankCounterModel('Bob'),
8    BankCounterModel('Cory'),
9    BankCounterModel('Dora'),
10  ]
```

### 2. 直接修改 `_counterList` 的成員

```
5  const List<BankCounterModel> _counterList = <BankCounterModel>[
6    BankCounterModel('Amy'),
7    BankCounterModel('Bob'),
8    BankCounterModel('Cory'),
9    BankCounterModel('Dora'),
10   BankCounterModel('Elsa'),
11  ]
```