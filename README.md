# qiita



 - [Qiitaの記事をGitHubリポジトリで管理する方法](https://qiita.com/Qiita/items/32c79014509987541130) 

 - [qiita-cli](https://github.com/increments/qiita-cli)


## 編集してみて思ったこと

### 記事の作成

ベース名がtitleに入っているので、変更する必要がある。

tagも忘れずつける。

### プレビュー画面

npx qiita preview でなく、Markdown Preview Enhanced でプレビューを見る方が速い。

ただし Qiita 独自記法（`:::note`、数式、コードブロックのファイル名など）は Qiita と同じには表示されないので、公開前に一度は `npx qiita preview` で確認する。

### 公開

**必ず `git pull` してから編集・push する。** push 後に GitHub Actions が "Updated by qiita-cli" コミット（`updated_at` の更新）を **GitHub 上に** 作るため、これを取り込まずに編集すると以下のどちらかで失敗する。

- `git push` が non-fast-forward で拒否される
- `updated_at` がずれて GitHub Actions が以下のエラーで失敗する

```
内容がQiita上の記事より古い可能性があります
```

#### 正しい手順

```bash
git pull             # 1. Actions が作ったコミットを取り込む（毎回必須）
# ファイルを編集
git add public/ && git commit -m "メッセージ"
git push             # 2. push すると GitHub Actions が自動で公開
```

- `npx qiita pull` は Qiita から記事を取得するだけで、git のコミットは揃わない。`git pull` の代わりにはならない。
- `git add .` だと `package.json` や `資料/` など記事以外の変更も入るので、記事だけなら `git add public/` にする。

### Qiita 上で更新を行ったとき

Qiita の Web 画面で編集した場合は、Qiita と同期してから GitHub にも反映する。

```bash
git pull             # 1. まず GitHub の最新を取り込む
npx qiita pull       # 2. Qiita の内容を手元に反映
git add public/ && git commit -m "Qiitaと同期"
git push             # 3. GitHub にも反映
```

commit・push しないと GitHub 側が古いままになり、次の公開で `updated_at` がずれる原因になる。
