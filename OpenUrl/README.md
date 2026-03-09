## OpenUrl ショートカット作成バッチ

このリポジトリには、任意の URL を開くだけの小さな exe（URL 固定ショートカット）を生成するためのバッチと C# テンプレートが含まれています。  
GitHub からクローンして、そのままローカルで利用できます。

- **GitHub 上のテンプレート**  
  - リポジトリ: `Nakashun-mf/tmpfile`  
  - パス: `OpenUrl/OpenUrlTemplate.cs`  
  - Raw URL: `https://raw.githubusercontent.com/Nakashun-mf/tmpfile/main/OpenUrl/OpenUrlTemplate.cs`

---

### 構成ファイル

- **`OpenUrl.bat`
  - URL を埋め込んだ exe を生成するメインのバッチファイルです。  
  - C# テンプレート `OpenUrlTemplate.cs` を元に、`__URL__` プレースホルダを実際の URL に置き換えてコンパイルします。
  - カレントフォルダに `OpenUrlTemplate.cs` が存在しない場合は、上記 GitHub の Raw URL から自動ダウンロードします。
  - バッチの末尾に `OpenUrlTemplate.cs` の全文をコメントとして保持しており、GitHub から取得できなくなった場合でも復元できます。
  - **テンプレートが GitHub から自動取得された場合、その実行中にだけ作成された `OpenUrlTemplate.cs` は、処理完了時に自動削除されます。**

- **`OpenUrlTemplate.cs`**  
  - 生成される exe の元になる C# コードです。
  - `const string Url = "__URL__";` という形でプレースホルダが定義されており、`bat` 実行時にここが指定 URL に置換されます。
  - 起動時に指定 URL を既定ブラウザで開き、URL 未設定や起動エラー時にはメッセージボックスでエラーを表示します。
  - **リポジトリに同梱されている場合はそのまま利用されますが、同梱されていない場合はバッチによって一時的にダウンロードされ、処理後に自動削除されます。**

---

### 動作環境

- **OS**: Windows 10 以降を想定
- **必須コンポーネント**
  - .NET Framework 4.x の `csc.exe`  
    - 例:  
      - `%SystemRoot%\Microsoft.NET\Framework64\v4.0.30319\csc.exe`  
      - `%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\csc.exe`
  - PowerShell（Windows 標準のもので可）

---

### 使い方（GitHub からクローンした場合）

- **1. ダブルクリックで起動する場合**
  - `OpenUrl
.bat` をエクスプローラーからダブルクリックします。
  - 「開きたい URL を入力して Enter を押してください。」と表示されるので、ブラウザで開きたい URL を入力して Enter を押します。
  - 正常にコンパイルされると `OpenUrl.exe`（または指定したファイル名）が生成されます。

- **2. コマンドラインから起動する場合**
  - `cmd` などでこのフォルダに移動して、以下のように実行します。

  ```bat
  OpenUrl.bat URL [出力exe名]
  ```

  - 使用例:
    - `OpenUrl.bat https://example.com`
      - → `OpenUrl.exe` を生成
    - `OpenUrl.bat https://example.com MyShortcut.exe`
      - → `MyShortcut.exe` を生成

---

### 生成された exe の挙動

- 起動すると、ビルド時に埋め込まれた URL を既定ブラウザで開きます。
- URL が空・未設定だった場合
  - 「URL が設定されていないため、ブラウザを起動できませんでした。」という警告ダイアログを表示して終了します。
- URL を開く際に例外が発生した場合
  - 「URL を開く際にエラーが発生しました。」というエラーダイアログを表示します。

---

### テンプレートの復元方法

1. `OpenUrl.bat` をテキストエディタで開きます。
2. ファイル末尾付近にある、`OpenUrlTemplate.cs` のソースが `rem` コメントとして埋め込まれている部分を探します。
3. そのコメント部分から先頭の `rem` を取り除き、新しいファイル `OpenUrlTemplate.cs` として保存します。
4. 以後は GitHub に依存せずローカルの `OpenUrlTemplate.cs` を使ってビルドできます。

---

### GitHub リポジトリとしてのメモ

- このフォルダ一式を GitHub に配置することで、別の PC にクローンしても同じ手順で URL 固定ショートカット exe を生成できます。


