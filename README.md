master: [![Build Status](https://travis-ci.org/tsukuba-pbl/NavigationFor_iOS.svg?branch=master)](https://travis-ci.org/tsukuba-pbl/NavigationFor_iOS)[![Coverage Status](https://coveralls.io/repos/github/tsukuba-pbl/NavigationFor_iOS/badge.svg?branch=master)](https://coveralls.io/github/tsukuba-pbl/NavigationFor_iOS?branch=master)

develop: [![Build Status](https://travis-ci.org/tsukuba-pbl/NavigationFor_iOS.svg?branch=develop)](https://travis-ci.org/tsukuba-pbl/NavigationFor_iOS)
[![Coverage Status](https://coveralls.io/repos/github/tsukuba-pbl/NavigationFor_iOS/badge.svg?branch=develop)](https://coveralls.io/github/tsukuba-pbl/NavigationFor_iOS?branch=develop)

# 研究開発プロジェクト2017 ナビゲーションアプリ用リポジトリ

## 環境構築

### Carthageのインストール
We use Carthage to manage library.so, please install Carhage.

```
brew install carthage
```

### fastlaneのインストール
We use fastlane. if you don't install fastlane, please install fastlane in following command.

```
sudo gem install fastlane
```
or 
```
brew cask install fastlane
```

## 実行
まずはじめに，必要なライブラリのインストール

```
carthage update
```

次にxcodeで立ち上げる.

## テスト
現状ユニットテストのみ，UIテストはとりあえず後回しで行う．優先度と重要度を考えると，最低限ユニットテストでいいと考えた．

### テストの実行
Please execute following command to test UnitTest.
```
fastlane test
```

# Backlog & Task
https://tree.taiga.io/project/minajun-tsukuba-rd-project-2017-ume-systems/backlog
