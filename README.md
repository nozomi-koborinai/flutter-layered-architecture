## このプロジェクトについて
Flutter大学メンバーで執筆した『Flutter設計パターン入門』の第７章 [『レイヤードアーキテクチャで作る』](https://zenn.dev/flutteruniv/books/flutter-architecture/viewer/5_layered-architecture
) で紹介しているサンプルアプリ。


## 環境構築

### バージョン管理
本プロジェクトはFlutterのバージョン管理に[fvm](https://fvm.app/)を利用している。  
プロジェクトのルートディレクトリで下記のコマンドを実行する。
```bash
fvm use 3.13.8
```
※ FVMのインストール・設定については、[こちらの記事](https://zenn.dev/riscait/articles/flutter-version-management)を参照。


### ビルド設定
`dart-define-from-file`にビルド時に渡す引数に応じて、以下のようにサーバーの環境の切り替えを行っている。  
`demo`: デモデータとの接続用。デモ用のレポジトリにつなぐ切り替えを行っている。  
(TODO: その他は実装後に記入）

利用しているIDEに応じて以下のように設定する。
#### Android Studio/IntelliJ IDEAの場合)
以下[こちらの記事](https://zenn.dev/mamushi/scraps/13c0232c88227e)を参考にスクショのように各環境を設定する

![](../../../Library/Application Support/CleanShot/media/media_vZMO2CJhIs/CleanShot 2023-08-05 at 16.12.19@2x.png)

#### VS Codeの場合)
launch.json経由でビルドする。
[参考](https://zenn.dev/altiveinc/articles/separating-environments-in-flutter?redirected=1#vs-code-%E3%81%AE%E8%A8%AD%E5%AE%9A%E4%BE%8B)

### ログイン方法
デモ環境においては、以下を入力してログインする。  
メールアドレス：test@example.com  
パスワード：test  