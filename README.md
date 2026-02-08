# GitHub Pages（Hamilton テーマ）

[jekyll-theme-hamilton](https://github.com/ngzhio/jekyll-theme-hamilton) を使った GitHub Pages のサイトです。

## 公開手順

1. このリポジトリを GitHub にプッシュする
2. リポジトリの **Settings → Pages** で：
   - **Source**: **GitHub Actions**（`jekyll-scholar` を使うため、ブランチではなく Actions でビルドします）
   - 初回は `.github/workflows/jekyll-pages.yml` が実行され、ビルド＆デプロイされます
3. 数分後に次の URL で表示されます：
   - リポジトリ名が `username.github.io` の場合: `https://username.github.io`
   - それ以外（例: `website`）の場合: `https://username.github.io/website`

## baseurl の設定

`_config.yml` の `baseurl` をリポジトリ名に合わせてください。

- リポジトリが **username.github.io** のとき: `baseurl: ""`
- リポジトリが **website** など他の名前のとき: `baseurl: "/website"`

## ローカルでプレビュー

```bash
bundle install
bundle exec jekyll serve
```

ブラウザで http://localhost:4000 を開きます（プロジェクトサイトの場合は http://localhost:4000/website ）。

## カスタマイズ

- **サイト情報**: `_config.yml` の `title`, `author`, `description` など
- **ナビゲーション**: `_data/navigation.yml`
- **SNS リンク**: `_data/social.yml`（コメントを外して URL を設定）
- **Publication（論文）**: `_bibliography/references.bib` に BibTeX を追加。Google Scholar の「引用」→「BibTeX」で取得した内容を貼り付けて追記できます。
- **スキン**: `_config.yml` の `skin`（daylight / midnight / sunrise / sunset）
- **ブログ記事**: `_posts/` に `YYYY-MM-DD-スラッグ.md` で追加
