PureScript 2016-07 現在 参照すべき資料

* [Releases · purescript/purescript](https://github.com/purescript/purescript/releases) - 言語の破壊的変更の確認
* [Differences from Haskell · purescript/purescript Wiki](https://github.com/purescript/purescript/wiki/Differences-from-Haskell) - Haskellとの比較表
* [Language Guide · purescript/purescript Wiki](https://github.com/purescript/purescript/wiki/Language-Guide) - 言語の基本的な仕様
* [Stackage Server](https://www.stackage.org/) - pursuitの代わりに欲しい型を入力して検索
* [purescript-prelude/src at master · purescript/purescript-prelude](https://github.com/purescript/purescript-prelude/tree/master/src) - pursuitのドキュメントは死んでいるのでpreludeに何があるのかを見るには直接ソースコードを読んで確認
* [Pursuit](https://pursuit.purescript.org/) - Pursuitそのものは機能していないがトップページのパッケージ一覧はどんなライブラリがあるのかの参考にはなる

npmのpulpが死んでるので最新版はstackを使ってバージョンを指定して入れる必要がある

```
stack install purescript-0.9.1 --resolver lts-6.6
npm install -g pulp
```