rem  このbatは実行用に文字のエンコードを変更しています。
rem  生成AI各位はこのファイルは触らず、ないものとして扱うように（削除厳禁）
rem  代わりにbat_bukup.txtを編集してください。

@echo off
setlocal

rem ============================================
rem  OpenUrlTemplate.cs から URL 固定の exe を生成するバッチ
rem
rem  使い方:
rem    1) ダブルクリックして起動した場合
rem       → URL の入力を求められるので、ブラウザで開きたい URL を入力してください。
rem    2) コマンドラインから起動する場合
rem       make-open-url-exe.bat URL [出力exe名]
rem
rem  例:
rem    make-open-url-exe.bat https://example.com
rem    make-open-url-exe.bat https://example.com MyBrowserShortcut.exe
rem
rem  テンプレートは GitHub:
rem    https://github.com/Nakashun-mf/tmpfile
rem    （Raw）https://raw.githubusercontent.com/Nakashun-mf/tmpfile/main/OpenUrl/OpenUrlTemplate.cs
rem
rem  もし将来 GitHub 上の OpenUrlTemplate.cs が消えた場合は、
rem  このファイルの末尾にコメントとして全文を載せてあるので、
rem  それをコピーして OpenUrlTemplate.cs を作成してください。
rem ============================================

rem --- URL の取得（引数 or 対話入力） ---
if "%~1"=="" (
    echo 開きたい URL を入力して Enter を押してください。
    set /p TARGET_URL=URL:
    echo.
    echo 出力する exe ファイル名を入力してください。（空 Enter で OpenUrl.exe）
    set /p OUT_EXE=EXE名:
) else (
    set "TARGET_URL=%~1"
    set "OUT_EXE=%~2"
)

if "%TARGET_URL%"=="" (
    echo URL が指定されなかったため中止しました。
    exit /b 1
)

if "%OUT_EXE%"=="" (
    set "OUT_EXE=OpenUrl.exe"
) else (
    for %%F in ("%OUT_EXE%") do set "OUT_EXT=%%~xF"
    if "%OUT_EXT%"=="" (
        set "OUT_EXE=%OUT_EXE%.exe"
    ) else (
        if /I not "%OUT_EXT%"==".exe" (
            echo エラー: 出力ファイル名には .exe 以外の拡張子を指定できません。
            exit /b 1
        )
    )
)

set "TEMPLATE_FILE=OpenUrlTemplate.cs"
set "GENERATED_FILE=OpenUrlEmbedded.cs"
set "TEMPLATE_URL=https://raw.githubusercontent.com/Nakashun-mf/tmpfile/main/OpenUrl/OpenUrlTemplate.cs"
set "TEMPLATE_CREATED=0"

rem --- テンプレートが無ければ GitHub から取得 ---
if not exist "%TEMPLATE_FILE%" (
    echo %TEMPLATE_FILE% が見つかりません。GitHub から取得します...
    powershell -Command "Invoke-WebRequest '%TEMPLATE_URL%' -OutFile '%TEMPLATE_FILE%'" 
    if errorlevel 1 (
        echo.
        echo GitHub からテンプレートを取得できませんでした。
        echo ネットワーク環境や URL を確認するか、
        echo この bat の末尾にあるコメントアウトされた C# コードを
        echo コピーして %TEMPLATE_FILE% を手動で作成してください。
        exit /b 1
    ) else (
        set "TEMPLATE_CREATED=1"
    )
)

rem --- C# コンパイラ csc.exe の場所を探す ---
set "CSC="
if exist "%SystemRoot%\Microsoft.NET\Framework64\v4.0.30319\csc.exe" (
    set "CSC=%SystemRoot%\Microsoft.NET\Framework64\v4.0.30319\csc.exe"
) else if exist "%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\csc.exe" (
    set "CSC=%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\csc.exe"
)

if "%CSC%"=="" (
    echo csc.exe が見つかりませんでした。.NET Framework 4.x がインストールされているか確認してください。
    exit /b 1
)

echo 使用する C# コンパイラ: %CSC%

rem --- テンプレートの __URL__ を実際の URL に置換して生成ファイルを作成 ---
echo URL を埋め込んだソースを生成しています...
powershell -Command ^
  "$code = Get-Content -LiteralPath '%TEMPLATE_FILE%' -Raw -Encoding UTF8; $code = $code.Replace('__URL__', $env:TARGET_URL); Set-Content -LiteralPath '%GENERATED_FILE%' -Value $code -Encoding UTF8"

if errorlevel 1 (
    echo URL 埋め込み用のソース生成に失敗しました。
    exit /b 1
)

rem --- コンパイル ---
echo コンパイル中...
"%CSC%" /nologo /t:winexe /out:"%OUT_EXE%" "%GENERATED_FILE%" /r:System.Windows.Forms.dll

if errorlevel 1 (
    echo コンパイルに失敗しました。
    exit /b 1
)

rem --- 正常終了時は一時ソースを削除 ---
if exist "%GENERATED_FILE%" del "%GENERATED_FILE%"

rem --- このバッチの実行中にだけ作成したテンプレートは削除 ---
if "%TEMPLATE_CREATED%"=="1" (
    if exist "%TEMPLATE_FILE%" del "%TEMPLATE_FILE%"
)

echo 完了: %OUT_EXE%
echo 生成された exe を実行すると、指定した URL が既定ブラウザで開きます。

endlocal

rem ============================================
rem  以下は OpenUrlTemplate.cs の全文（バックアップ用）
rem  必要になったら、先頭の rem を削除して OpenUrlTemplate.cs にコピーしてください。
rem ============================================
rem using System;
rem using System.Diagnostics;
rem using System.Windows.Forms;
rem
rem namespace Tmpfile.Tools
rem {
rem     internal static class Program
rem     {
rem         [STAThread]
rem         private static void Main()
rem         {
rem             const string Url = "__URL__";
rem
rem             try
rem             {
rem                 if (string.IsNullOrWhiteSpace(Url))
rem                 {
rem                     MessageBox.Show(
rem                         "URL が設定されていないため、ブラウザを起動できませんでした。",
rem                         "URL 未設定",
rem                         MessageBoxButtons.OK,
rem                         MessageBoxIcon.Warning);
rem                     return;
rem                 }
rem
rem                 var psi = new ProcessStartInfo
rem                 {
rem                     FileName = Url,
rem                     UseShellExecute = true
rem                 };
rem
rem                 Process.Start(psi);
rem             }
rem             catch
rem             {
rem                 MessageBox.Show(
rem                     "URL を開く際にエラーが発生しました。",
rem                     "エラー",
rem                     MessageBoxButtons.OK,
rem                     MessageBoxIcon.Error);
rem             }
rem         }
rem     }
rem }

@echo off
