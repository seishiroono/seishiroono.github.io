# GitHub Pages のビルド設定（必須）

## エラー「Unknown tag 'bibliography'」が出る場合

このリポジトリは **論文一覧（Publication）** に [jekyll-scholar](https://github.com/inukshuk/jekyll-scholar) を使っています。  
jekyll-scholar は **GitHub が提供する「ブランチからのビルド」では利用できません**。

ログに次のように出ている場合は、**まだ「Deploy from a branch」でビルドされています**。

- `GitHub Pages: github-pages v232`
- `Requiring: jekyll-paginate` のあとに **`Requiring: jekyll-scholar` が無い**
- `Error: Liquid syntax error (line 5): Unknown tag 'bibliography'`

## 対処手順（Source を GitHub Actions に変更）

1. リポジトリの **Settings** を開く
2. 左メニューで **Pages** をクリック
3. **Build and deployment** の **Source** で、  
   **「GitHub Actions」** を選ぶ（「Deploy from a branch」のままにしない）
4. 保存後、`main` に push するか、**Actions** タブから「Build and deploy Jekyll to GitHub Pages」ワークフローを手動実行する
5. そのワークフローが **成功**すれば、サイトは正しくビルド・デプロイされます

## 変更後のビルド

- **Source: GitHub Actions** にすると、  
  `.github/workflows/jekyll-pages.yml` が実行されます。
- このワークフローでは `bundle install` → `bundle exec jekyll build` が走り、  
  **Gemfile の jekyll-scholar が使われます**。
- 論文一覧（`/publication/`）が正常に表示されます。

## まとめ

| Source | jekyll-scholar | 論文一覧 | 結果 |
|--------|-----------------|----------|------|
| Deploy from a branch | 使えない | `Unknown tag 'bibliography'` でビルド失敗 | ❌ |
| **GitHub Actions** | 使える | 表示される | ✅ |

**必ず Source を「GitHub Actions」に設定してください。**
