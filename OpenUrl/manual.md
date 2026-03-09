---
marp: true
theme: default
size: A4
paginate: true
---

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@300;400;500;700;900&family=Noto+Serif+JP:wght@400;700&display=swap');

:root {
  --primary: #1a2f5e;
  --accent: #2d7dd2;
  --accent-light: #5ba3e8;
  --success: #0d9488;
  --warning: #d97706;
  --danger: #dc2626;
  --bg-light: #f0f4fa;
  --bg-code: #1e2d42;
  --text-main: #1a202c;
  --text-sub: #4a5568;
  --border: #cbd5e0;
  --white: #ffffff;
}

section {
  font-family: 'Noto Sans JP', 'Yu Gothic UI', 'Meiryo UI', sans-serif;
  font-size: 13.5px;
  line-height: 1.75;
  color: var(--text-main);
  background: var(--white);
  padding: 40px 52px;
  position: relative;
}

/* ─── COVER ─── */
section.cover {
  background: linear-gradient(145deg, #0d1b3e 0%, #1a3468 45%, #1e4a8a 100%);
  padding: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
  color: var(--white);
}

section.cover::before {
  content: '';
  position: absolute;
  top: 0; right: 0;
  width: 42%;
  height: 100%;
  background: linear-gradient(135deg, rgba(45,125,210,0.35) 0%, rgba(91,163,232,0.12) 100%);
  clip-path: polygon(15% 0%, 100% 0%, 100% 100%, 0% 100%);
}

section.cover::after {
  content: '';
  position: absolute;
  bottom: 0; left: 0;
  width: 100%;
  height: 4px;
  background: linear-gradient(90deg, #2d7dd2, #5ba3e8, #0d9488);
}

.cover-inner {
  padding: 60px 64px;
  z-index: 1;
  width: 100%;
  box-sizing: border-box;
}

.cover-badge {
  display: inline-block;
  background: rgba(45,125,210,0.55);
  border: 1px solid rgba(91,163,232,0.6);
  color: #a8d4ff;
  font-size: 10px;
  font-weight: 500;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  padding: 4px 14px;
  border-radius: 2px;
  margin-bottom: 28px;
}

.cover-title {
  font-size: 54px;
  font-weight: 900;
  letter-spacing: -0.02em;
  line-height: 1.0;
  margin: 0 0 6px;
}

.cover-title span {
  color: #5ba3e8;
}

.cover-subtitle {
  font-size: 16px;
  font-weight: 300;
  color: rgba(255,255,255,0.72);
  letter-spacing: 0.04em;
  margin: 10px 0 44px;
}

.cover-divider {
  width: 56px;
  height: 3px;
  background: linear-gradient(90deg, #5ba3e8, #0d9488);
  border-radius: 2px;
  margin-bottom: 36px;
}

.cover-meta {
  display: flex;
  gap: 40px;
  font-size: 11px;
  color: rgba(255,255,255,0.55);
}

.cover-meta-item strong {
  display: block;
  color: rgba(255,255,255,0.85);
  font-size: 12px;
  margin-bottom: 2px;
}

.cover-icon {
  position: absolute;
  right: 64px;
  top: 50%;
  transform: translateY(-50%);
  font-size: 100px;
  opacity: 0.15;
  z-index: 0;
}

/* ─── TOC PAGE ─── */
section.toc {
  background: var(--bg-light);
}

section.toc h1 {
  font-size: 28px;
  font-weight: 900;
  color: var(--primary);
  border: none;
  padding: 0;
  margin-bottom: 32px;
  letter-spacing: -0.02em;
}

.toc-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 14px;
}

.toc-item {
  background: var(--white);
  border-radius: 8px;
  padding: 16px 20px;
  border-left: 4px solid var(--accent);
  box-shadow: 0 1px 4px rgba(0,0,0,0.07);
  display: flex;
  align-items: center;
  gap: 14px;
}

.toc-item.green { border-left-color: var(--success); }
.toc-item.amber { border-left-color: var(--warning); }

.toc-num {
  font-size: 22px;
  font-weight: 900;
  color: var(--accent);
  line-height: 1;
  min-width: 28px;
}

.toc-item.green .toc-num { color: var(--success); }
.toc-item.amber .toc-num { color: var(--warning); }

.toc-text strong {
  display: block;
  font-size: 13px;
  color: var(--primary);
}

.toc-text span {
  font-size: 11px;
  color: var(--text-sub);
}

/* ─── SECTION DIVIDER ─── */
section.divider {
  background: linear-gradient(135deg, #1a2f5e 0%, #2d5086 100%);
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 0 64px;
  color: var(--white);
}

section.divider .sec-label {
  font-size: 11px;
  letter-spacing: 0.2em;
  text-transform: uppercase;
  color: rgba(255,255,255,0.45);
  margin-bottom: 12px;
}

section.divider h2 {
  font-size: 40px;
  font-weight: 900;
  margin: 0 0 16px;
  line-height: 1.1;
  letter-spacing: -0.02em;
  border: none;
  color: var(--white);
  padding: 0;
}

section.divider p {
  font-size: 14px;
  color: rgba(255,255,255,0.65);
  max-width: 480px;
  line-height: 1.7;
}

section.divider::after {
  content: '';
  position: absolute;
  right: 0; top: 0;
  width: 35%;
  height: 100%;
  background: rgba(255,255,255,0.03);
  clip-path: polygon(20% 0%, 100% 0%, 100% 100%, 0% 100%);
}

/* ─── NORMAL PAGES ─── */
h1 {
  font-size: 22px;
  font-weight: 900;
  color: var(--primary);
  padding-bottom: 10px;
  border-bottom: 2px solid var(--accent);
  margin-bottom: 24px;
  letter-spacing: -0.01em;
}

h2 {
  font-size: 16px;
  font-weight: 700;
  color: var(--primary);
  margin: 24px 0 12px;
  padding-left: 12px;
  border-left: 4px solid var(--accent);
}

h3 {
  font-size: 13px;
  font-weight: 700;
  color: var(--text-main);
  margin: 16px 0 8px;
}

p { margin: 0 0 12px; }
ul, ol { margin: 0 0 12px; padding-left: 20px; }
li { margin-bottom: 5px; }

/* Code blocks */
code {
  font-family: 'Consolas', 'Cascadia Code', 'Source Code Pro', monospace;
  font-size: 12px;
  background: #e8edf5;
  color: #c0392b;
  padding: 1px 6px;
  border-radius: 3px;
}

pre {
  background: var(--bg-code);
  color: #a8d8a8;
  border-radius: 8px;
  padding: 18px 22px;
  margin: 12px 0;
  overflow: hidden;
  box-shadow: 0 4px 12px rgba(0,0,0,0.18);
  position: relative;
}

pre::before {
  content: '●  ●  ●';
  position: absolute;
  top: 10px;
  left: 16px;
  font-size: 9px;
  color: rgba(255,255,255,0.2);
  letter-spacing: 4px;
}

pre code {
  background: none;
  color: inherit;
  padding: 0;
  font-size: 12px;
  line-height: 1.65;
}

/* Info boxes */
.box {
  border-radius: 8px;
  padding: 14px 18px;
  margin: 14px 0;
  font-size: 12.5px;
  line-height: 1.65;
  display: flex;
  gap: 12px;
  align-items: flex-start;
}

.box-icon {
  font-size: 18px;
  line-height: 1;
  flex-shrink: 0;
  margin-top: 1px;
}

.box.info {
  background: #dbeafe;
  border-left: 4px solid var(--accent);
  color: #1e3a5f;
}

.box.success {
  background: #d1fae5;
  border-left: 4px solid var(--success);
  color: #134e3a;
}

.box.warning {
  background: #fef3c7;
  border-left: 4px solid var(--warning);
  color: #7c4a00;
}

.box.danger {
  background: #fee2e2;
  border-left: 4px solid var(--danger);
  color: #7f1d1d;
}

/* Steps */
.steps { counter-reset: step; margin: 0; padding: 0; list-style: none; }
.steps li {
  counter-increment: step;
  position: relative;
  padding: 12px 16px 12px 52px;
  margin-bottom: 10px;
  background: var(--bg-light);
  border-radius: 8px;
  border: 1px solid var(--border);
}

.steps li::before {
  content: counter(step);
  position: absolute;
  left: 14px;
  top: 50%;
  transform: translateY(-50%);
  width: 26px;
  height: 26px;
  background: var(--accent);
  color: var(--white);
  font-size: 12px;
  font-weight: 700;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  line-height: 26px;
  text-align: center;
}

/* Requirement table */
.req-table {
  width: 100%;
  border-collapse: collapse;
  font-size: 12.5px;
  margin: 14px 0;
}

.req-table th {
  background: var(--primary);
  color: var(--white);
  padding: 10px 14px;
  text-align: left;
  font-weight: 600;
  font-size: 12px;
}

.req-table td {
  padding: 10px 14px;
  border-bottom: 1px solid var(--border);
  vertical-align: top;
}

.req-table tr:nth-child(even) td { background: var(--bg-light); }
.req-table tr:hover td { background: #dbeafe22; }

.req-table .label {
  color: var(--text-sub);
  font-weight: 600;
  white-space: nowrap;
  width: 130px;
}

/* Badge */
.badge {
  display: inline-block;
  padding: 2px 9px;
  border-radius: 12px;
  font-size: 10.5px;
  font-weight: 600;
}

.badge.required { background: #fee2e2; color: #b91c1c; }
.badge.optional { background: #d1fae5; color: #065f46; }
.badge.auto     { background: #dbeafe; color: #1e40af; }

/* Flow diagram */
.flow {
  display: flex;
  align-items: center;
  gap: 0;
  margin: 20px 0;
  flex-wrap: nowrap;
}

.flow-box {
  background: var(--primary);
  color: var(--white);
  padding: 10px 14px;
  border-radius: 6px;
  font-size: 11.5px;
  font-weight: 600;
  text-align: center;
  min-width: 90px;
  line-height: 1.4;
}

.flow-box.green { background: var(--success); }
.flow-box.blue  { background: var(--accent); }
.flow-box.amber { background: var(--warning); }

.flow-arrow {
  font-size: 20px;
  color: var(--border);
  margin: 0 6px;
  flex-shrink: 0;
}

/* Inline keyword */
.key {
  display: inline-block;
  background: #e2e8f0;
  color: var(--primary);
  padding: 1px 8px;
  border-radius: 3px;
  font-family: 'Consolas', monospace;
  font-size: 12px;
  font-weight: 700;
  border: 1px solid #cbd5e0;
}

/* Page header accent */
section:not(.cover):not(.toc):not(.divider)::before {
  content: '';
  position: absolute;
  top: 0; left: 0;
  width: 100%;
  height: 4px;
  background: linear-gradient(90deg, var(--primary), var(--accent));
}

/* Footer / pagination */
section::after {
  color: #94a3b8;
  font-size: 10px;
  font-family: 'Noto Sans JP', sans-serif;
}

/* Two-column layout */
.cols {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
  margin: 12px 0;
}

.cols-3 {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 16px;
  margin: 12px 0;
}

/* Card */
.card {
  background: var(--bg-light);
  border-radius: 10px;
  padding: 18px 20px;
  border: 1px solid var(--border);
}

.card h3 {
  margin-top: 0;
  color: var(--primary);
  font-size: 13px;
}

/* Highlight text */
em { font-style: normal; color: var(--accent); font-weight: 600; }
strong { color: var(--primary); }
</style>

<!-- _class: cover -->
<!-- _paginate: false -->

<div class="cover-inner">
  <div class="cover-badge">User Manual &nbsp;·&nbsp; Ver. 1.0</div>
  <div class="cover-title">Open<span>Url</span></div>
  <div class="cover-subtitle">URL 固定ショートカット EXE 生成ツール</div>
  <div class="cover-divider"></div>
  <div class="cover-meta">
    <div class="cover-meta-item">
      <strong>対象 OS</strong>
      Windows 10 / 11
    </div>
    <div class="cover-meta-item">
      <strong>必須環境</strong>
      .NET Framework 4.x
    </div>
    <div class="cover-meta-item">
      <strong>発行日</strong>
      2026 年 3 月
    </div>
  </div>
</div>

---

<!-- _class: toc -->
<!-- _paginate: false -->

# 目次

<div class="toc-grid">
  <div class="toc-item">
    <div class="toc-num">1</div>
    <div class="toc-text">
      <strong>OpenUrl とは</strong>
      <span>概要・用途・仕組み</span>
    </div>
  </div>
  <div class="toc-item green">
    <div class="toc-num">2</div>
    <div class="toc-text">
      <strong>動作環境</strong>
      <span>必須コンポーネント・対象 OS</span>
    </div>
  </div>
  <div class="toc-item blue">
    <div class="toc-num">3</div>
    <div class="toc-text">
      <strong>ダブルクリックで使う</strong>
      <span>GUI 対話モードの手順</span>
    </div>
  </div>
  <div class="toc-item">
    <div class="toc-num">4</div>
    <div class="toc-text">
      <strong>コマンドラインで使う</strong>
      <span>引数指定・バッチ連携</span>
    </div>
  </div>
  <div class="toc-item amber">
    <div class="toc-num">5</div>
    <div class="toc-text">
      <strong>生成された EXE の動作</strong>
      <span>URL 起動・エラー時の挙動</span>
    </div>
  </div>
  <div class="toc-item green">
    <div class="toc-num">6</div>
    <div class="toc-text">
      <strong>テンプレートの復元</strong>
      <span>オフライン環境での対処</span>
    </div>
  </div>
  <div class="toc-item">
    <div class="toc-num">7</div>
    <div class="toc-text">
      <strong>トラブルシューティング</strong>
      <span>よくあるエラーと対処法</span>
    </div>
  </div>
  <div class="toc-item amber">
    <div class="toc-num">8</div>
    <div class="toc-text">
      <strong>よくある質問（FAQ）</strong>
      <span>仕様・注意事項</span>
    </div>
  </div>
</div>

---

<!-- _class: divider -->

<div class="sec-label">Section 01</div>

## OpenUrl とは

特定の URL を既定ブラウザで開くだけの、
小さな EXE ファイルを一瞬で生成するツールです。

---

# 1 &nbsp; OpenUrl とは

**OpenUrl** は、指定した URL を既定ブラウザで開くだけのミニマルな EXE ファイルを、バッチスクリプト一発で生成するデスクトップユーティリティです。

<div class="cols-3">
  <div class="card">
    <h3>🔗 &nbsp;ワンクリック起動</h3>
    生成した EXE をダブルクリックするだけで、設定済みの URL が即座にブラウザで開きます。
  </div>
  <div class="card">
    <h3>📦 &nbsp;依存ゼロで動作</h3>
    生成後の EXE は単体で動作。配布先に追加インストール不要です。
  </div>
  <div class="card">
    <h3>🛠 &nbsp;バッチ一発生成</h3>
    C# テンプレートと <code>csc.exe</code> を使い、その場でコンパイルします。
  </div>
</div>

## 典型的な使用例

<ul>
  <li>社内ポータルや SharePoint サイトへの<strong>デスクトップショートカット</strong>を標準化して配布</li>
  <li>毎朝開くダッシュボードの URL をショートカット EXE としてタスクバーにピン留め</li>
  <li>URL が変わりにくいシステムへの<strong>クイックアクセスランチャー</strong>として利用</li>
</ul>

## 処理の流れ

<div class="flow">
  <div class="flow-box">URL を入力</div>
  <div class="flow-arrow">→</div>
  <div class="flow-box blue">テンプレート<br>取得／確認</div>
  <div class="flow-arrow">→</div>
  <div class="flow-box blue">URL を埋め込み<br>ソース生成</div>
  <div class="flow-arrow">→</div>
  <div class="flow-box blue">csc.exe で<br>コンパイル</div>
  <div class="flow-arrow">→</div>
  <div class="flow-box green">EXE 完成！</div>
</div>

<div class="box info">
  <div class="box-icon">💡</div>
  <div>テンプレートファイル（<code>OpenUrlTemplate.cs</code>）がローカルに存在しない場合は、GitHub から自動ダウンロードされます。ダウンロードされたファイルは処理完了後に<strong>自動で削除</strong>されます。</div>
</div>

---

<!-- _class: divider -->

<div class="sec-label">Section 02</div>

## 動作環境

利用開始前に必要なコンポーネントを
確認してください。

---

# 2 &nbsp; 動作環境

<table class="req-table">
  <thead>
    <tr>
      <th style="width:140px">項目</th>
      <th>必要なもの</th>
      <th style="width:80px">種別</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="label">オペレーティングシステム</td>
      <td>Windows 10 以降（64 bit 推奨）</td>
      <td><span class="badge required">必須</span></td>
    </tr>
    <tr>
      <td class="label">.NET Framework</td>
      <td>
        バージョン 4.x（<code>csc.exe</code> を含む）<br>
        <small style="color:#718096">
          64 bit: <code>%SystemRoot%\Microsoft.NET\Framework64\v4.0.30319\csc.exe</code><br>
          32 bit: <code>%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\csc.exe</code>
        </small>
      </td>
      <td><span class="badge required">必須</span></td>
    </tr>
    <tr>
      <td class="label">PowerShell</td>
      <td>Windows 標準搭載のもので可（バージョン 5.1 以降）</td>
      <td><span class="badge required">必須</span></td>
    </tr>
    <tr>
      <td class="label">インターネット接続</td>
      <td>テンプレートファイルのオンライン自動取得時のみ必要</td>
      <td><span class="badge optional">任意</span></td>
    </tr>
    <tr>
      <td class="label">OpenUrlTemplate.cs</td>
      <td>同フォルダに配置してあれば不要（GitHub から自動取得）</td>
      <td><span class="badge auto">自動取得</span></td>
    </tr>
  </tbody>
</table>

## .NET Framework の確認方法

コマンドプロンプトで以下を実行し、`csc.exe` の存在を確認します。

```bat
dir "%SystemRoot%\Microsoft.NET\Framework64\v4.0.30319\csc.exe"
```

<div class="box success">
  <div class="box-icon">✅</div>
  <div>Windows 10 / 11 には <strong>.NET Framework 4.x が標準搭載</strong>されています。ほとんどの環境では追加インストール不要です。</div>
</div>

---

<!-- _class: divider -->

<div class="sec-label">Section 03</div>

## ダブルクリックで使う

マウス操作だけで EXE を生成する
もっとも簡単な使い方です。

---

# 3 &nbsp; ダブルクリックで使う（対話モード）

エクスプローラーから `run.bat` をダブルクリックするだけで、ウィザード形式で EXE を生成できます。

<ol class="steps">
  <li>エクスプローラーで OpenUrl フォルダを開き、<strong><code>run.bat</code></strong> をダブルクリックします。</li>
  <li>コマンドプロンプトウィンドウが起動します。以下のプロンプトが表示されたら、<strong>ブラウザで開きたい URL</strong> を入力して <kbd>Enter</kbd> を押します。<br><br>
  <code>開きたい URL を入力して Enter を押してください。</code><br>
  <code>URL:</code> <em>← ここに URL を入力</em></li>
  <li>次に EXE のファイル名を入力します。空白のまま <kbd>Enter</kbd> を押すと、<strong><code>OpenUrl.exe</code></strong> という名前で生成されます。<br><br>
  <code>出力する exe ファイル名を入力してください。（空 Enter で OpenUrl.exe）</code><br>
  <code>EXE名:</code> <em>← 例: MyShortcut.exe</em></li>
  <li>コンパイルが実行され、正常に完了すると <strong>同フォルダに EXE ファイルが生成</strong>されます。</li>
</ol>

<div class="cols">
  <div class="box success">
    <div class="box-icon">✅</div>
    <div><strong>成功時</strong><br>「完了: OpenUrl.exe」と表示され、EXE が生成されます。ウィンドウが閉じたら完了です。</div>
  </div>
  <div class="box warning">
    <div class="box-icon">⚠️</div>
    <div><strong>URL を入力せずに Enter</strong><br>「URL が指定されなかったため中止します。」と表示され処理を中断します。</div>
  </div>
</div>

---

<!-- _class: divider -->

<div class="sec-label">Section 04</div>

## コマンドラインで使う

引数を直接指定することで、
バッチや自動化処理との連携が可能です。

---

# 4 &nbsp; コマンドラインで使う

コマンドプロンプトや PowerShell から引数を渡すことで、対話なしにワンステップで EXE を生成できます。

## 構文

```bat
run.bat  <URL>  [出力EXE名]
```

<table class="req-table">
  <thead>
    <tr><th>引数</th><th>説明</th><th>省略</th></tr>
  </thead>
  <tbody>
    <tr>
      <td><code>&lt;URL&gt;</code></td>
      <td>EXE に埋め込む URL。<code>https://</code> から始まる完全な URL を指定してください。</td>
      <td><span class="badge required">必須</span></td>
    </tr>
    <tr>
      <td><code>[出力EXE名]</code></td>
      <td>生成するファイル名。拡張子 <code>.exe</code> を付けても省略しても可。省略時は <code>OpenUrl.exe</code>。</td>
      <td><span class="badge optional">省略可</span></td>
    </tr>
  </tbody>
</table>

## 使用例

```bat
rem 例 1：最もシンプルな使い方（OpenUrl.exe を生成）
run.bat https://example.com

rem 例 2：出力 EXE 名を指定する
run.bat https://example.com MyShortcut.exe

rem 例 3：社内ポータル用のショートカットを生成
run.bat https://intranet.company.local/portal 社内ポータル.exe
```

<div class="box info">
  <div class="box-icon">💡</div>
  <div>出力ファイル名に <code>.exe</code> 以外の拡張子を指定するとエラーになります。拡張子を省略した場合は自動的に <code>.exe</code> が付加されます。</div>
</div>

---

<!-- _class: divider -->

<div class="sec-label">Section 05</div>

## 生成された EXE の動作

ダブルクリック一発で URL が開く
シンプルな仕様です。

---

# 5 &nbsp; 生成された EXE の動作

生成された EXE ファイルは単体で動作し、外部ランタイム等への依存はありません。

## 正常時の動作

<ol class="steps">
  <li>EXE をダブルクリックします。</li>
  <li>ビルド時に埋め込まれた URL が <strong>既定のブラウザ</strong> で開きます。</li>
  <li>EXE のウィンドウやプロセスは即座に終了します（バックグラウンドに残りません）。</li>
</ol>

## エラー時の動作

EXE が URL を開けなかった場合、以下のいずれかのメッセージボックスが表示されます。

<div class="cols">
  <div class="box warning">
    <div class="box-icon">⚠️</div>
    <div>
      <strong>URL 未設定の警告</strong><br>
      「URL が設定されていないため、ブラウザを起動できませんでした。」<br>
      <small>（<code>__URL__</code> の置換が失敗した場合など）</small>
    </div>
  </div>
  <div class="box danger">
    <div class="box-icon">🚫</div>
    <div>
      <strong>起動エラー</strong><br>
      「URL を開く際にエラーが発生しました。」<br>
      <small>（OS の既定ブラウザが未設定、ネットワーク障害など）</small>
    </div>
  </div>
</div>

<div class="box info">
  <div class="box-icon">🔍</div>
  <div>EXE に埋め込まれた URL を後から確認・変更することはできません。URL を変更したい場合は <code>run.bat</code> を再実行して EXE を作り直してください。</div>
</div>

---

<!-- _class: divider -->

<div class="sec-label">Section 06</div>

## テンプレートの復元

ネットワークに接続できない環境でも、
バッチ内に埋め込まれた手順で対処できます。

---

# 6 &nbsp; テンプレートの復元（オフライン環境）

`OpenUrlTemplate.cs` がフォルダに存在せず、GitHub へのアクセスもできない環境では、バッチファイル内に埋め込まれたバックアップから手動で復元できます。

<ol class="steps">
  <li><strong><code>run.bat</code> をテキストエディタで開きます。</strong><br>右クリック →「メモ帳で開く」など。文字コードは Shift-JIS です。</li>
  <li><strong>ファイル末尾付近の埋め込みソースを探します。</strong><br>以下のようなコメント行のブロックを探してください。<br><br>
  <code>rem using System;</code><br>
  <code>rem using System.Diagnostics;</code><br>
  <code>rem namespace Tmpfile.Tools { ...</code></li>
  <li><strong>各行の先頭にある <code>rem </code>（半角スペース含む）を削除します。</strong><br>テキストエディタの「一括置換」機能を使うと効率的です。<br>置換対象：<code>rem </code> → 置換後：（空欄）</li>
  <li><strong>ファイル名 <code>OpenUrlTemplate.cs</code> として同じフォルダに保存します。</strong><br>文字コードは <strong>UTF-8（BOM なし）</strong> で保存してください。</li>
  <li>以後は GitHub に接続せず、ローカルのテンプレートを使って EXE を生成できます。</li>
</ol>

<div class="box success">
  <div class="box-icon">📋</div>
  <div>バッチファイルにテンプレート全文が埋め込まれているため、ネットワーク環境がなくても<strong>完全にオフラインで</strong> EXE 生成ができます。</div>
</div>

---

<!-- _class: divider -->

<div class="sec-label">Section 07</div>

## トラブルシューティング

エラーが出たときの
確認ポイントと対処法をまとめました。

---

# 7 &nbsp; トラブルシューティング

<table class="req-table">
  <thead>
    <tr>
      <th style="width:38%">現象・エラーメッセージ</th>
      <th>原因</th>
      <th>対処法</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>csc.exe が見つかりませんでした</code></td>
      <td>.NET Framework 4.x がインストールされていない</td>
      <td>Windows Update を実行するか、Microsoft 公式サイトから .NET Framework 4.x をインストールしてください。</td>
    </tr>
    <tr>
      <td><code>GitHub からテンプレートを取得できませんでした</code></td>
      <td>インターネット未接続 / プロキシ設定の問題</td>
      <td>ネットワーク設定を確認するか、Section 6 の手順でテンプレートをローカルに復元してください。</td>
    </tr>
    <tr>
      <td><code>コンパイルに失敗しました</code></td>
      <td>URL に特殊文字が含まれている / テンプレートが破損している</td>
      <td>URL を見直し、特殊文字（<code>"</code> など）が含まれていないか確認。テンプレートを再取得または復元してください。</td>
    </tr>
    <tr>
      <td>EXE が生成されたが、クリックしても何も起きない</td>
      <td>既定ブラウザが設定されていない</td>
      <td>Windows の設定 → アプリ → 既定のアプリ で既定ブラウザを設定してください。</td>
    </tr>
    <tr>
      <td>生成した EXE をダブルクリックすると警告が出る</td>
      <td>Windows SmartScreen の警告</td>
      <td>「詳細情報」→「実行」をクリックしてください。信頼できる配布元の場合、署名付き EXE の作成をご検討ください。</td>
    </tr>
    <tr>
      <td>出力ファイル名に <code>.exe</code> 以外の拡張子を指定した</td>
      <td>バリデーションエラー</td>
      <td>出力ファイル名は <code>.exe</code> 拡張子のみ指定可能です。拡張子を省略するか <code>.exe</code> を明示してください。</td>
    </tr>
  </tbody>
</table>

---

<!-- _class: divider -->

<div class="sec-label">Section 08</div>

## よくある質問（FAQ）

仕様・注意事項に関する
よくある質問をまとめました。

---

# 8 &nbsp; よくある質問（FAQ）

**Q1. 生成した EXE の URL を後から変更できますか？**

いいえ。URL はコンパイル時に EXE 内部に静的に埋め込まれます。変更するには `run.bat` を再実行して新しい EXE を生成してください。

---

**Q2. 同名の EXE が既に存在する場合、上書きされますか？**

はい。同フォルダに同名のファイルが存在する場合、確認なしに上書きされます。重要なファイルは事前に別名でバックアップしてください。

---

**Q3. `http://` の URL は使えますか？**

使用できます。ただし、ブラウザやサイト側の設定によっては HTTPS にリダイレクトされる場合があります。

---

**Q4. `run.bat` と `make-open-url-exe.bat` の違いは何ですか？**

`run.bat` は文字コード（Shift-JIS）対策のためのラッパーです。実際の処理は同内容です。編集する場合は元になる `bat_bukup.txt` 側を編集することを推奨します。

---

**Q5. テンプレートファイルは同梱しなくても大丈夫ですか？**

問題ありません。`OpenUrlTemplate.cs` が存在しない場合は GitHub から自動取得されます。ただし、ネットワーク環境がない場合は Section 6 の手順で事前に復元しておいてください。

---

**Q6. 生成した EXE を他の PC に配布できますか？**

配布可能です。生成 EXE の実行には .NET Framework 4.x が必要です（Windows 10 / 11 には標準搭載）。

---

<!-- _paginate: false -->
<!-- _class: cover -->

<div class="cover-inner">
  <div style="font-size:13px; color:rgba(255,255,255,0.45); letter-spacing:0.1em; text-transform:uppercase; margin-bottom:18px;">End of Document</div>
  <div style="font-size:36px; font-weight:900; letter-spacing:-0.02em; margin-bottom:8px;">Open<span style="color:#5ba3e8">Url</span></div>
  <div style="font-size:13px; color:rgba(255,255,255,0.55); margin-bottom:40px;">URL 固定ショートカット EXE 生成ツール &nbsp;|&nbsp; ユーザーマニュアル Ver. 1.0</div>
  <div style="width:40px; height:2px; background:linear-gradient(90deg,#5ba3e8,#0d9488); margin-bottom:36px;"></div>
  <div style="font-size:11px; color:rgba(255,255,255,0.35); line-height:1.8;">
    本マニュアルの内容は予告なく変更される場合があります。<br>
    最新情報は GitHub リポジトリ（Nakashun-mf/tmpfile）をご参照ください。
  </div>
</div>
