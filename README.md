# qiita



 - [Qiitaの記事をGitHubリポジトリで管理する方法](https://qiita.com/Qiita/items/32c79014509987541130) 

 - [cli](https://github.com/increments/qiita-cli)


## 編集してみて思ったこと

### 記事の作成

ベース名がtitleに入っているので、変更する必要がある。

tagも忘れずつける。

### プレビュー画面

npx qiita preview でなく、Markdown Preview Enhanced でプレビューを見る方が速い。

### 公開

普通にpushしても良いが、記事作成または更新日時をpullする必要がありそうなので、以下のようにする。

```
npx qiita publish 記事のファイルのベース名
```