# qiita



 - [Qiitaの記事をGitHubリポジトリで管理する方法](https://qiita.com/Qiita/items/32c79014509987541130) 

 - [qiita-cli](https://github.com/increments/qiita-cli)


## 編集してみて思ったこと

### 記事の作成

ベース名がtitleに入っているので、変更する必要がある。

tagも忘れずつける。

### プレビュー画面

npx qiita preview でなく、Markdown Preview Enhanced でプレビューを見る方が速い。

### 公開

**必ず `qiita pull` してから編集・push する。** 順番を守らないと `updated_at` がずれて GitHub Actions が以下のエラーで失敗する。

```
内容がQiita上の記事より古い可能性があります
```

#### 正しい手順

```bash
npx qiita pull       # 1. まず Qiita から最新を取得
# ファイルを編集
git add . && git commit -m "メッセージ"
git push             # 2. push すると GitHub Actions が自動で公開
```

push 後、Qiita-cli が `updated_at` を更新した "Updated by qiita-cli" コミットが自動で作られる。次に編集するときは再度 `qiita pull` を忘れずに。

### Qiita 上で更新を行ったとき

以下でQiita と同期

```
npx qiita pull
```
