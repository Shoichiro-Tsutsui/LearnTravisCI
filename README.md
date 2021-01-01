# Juliaパッケージを作成して、TravisCIと連携させる方法
OSはWindows10を仮定する。
簡単のため、git コマンドは GitHub Desktop で操作するものとする。
`> (文字列)` は、コマンドプロンプトに `(文字列)` を入力することを表す。

## パッケージの作成
1. Githubで新しくレポジトリを作成する。(e.g LearnTravisCI)
1. ローカルのマシンにクローンする。`LearnTravisCI` という空ディレクトリができる。
1. `julia_package_template.jl` を `LearnTravisCI` へコピーする。
1. `julia_package_template.jl` を適切に編集する。詳しくはコード内のコメント参照。
1. `>julia julia_package_template.jl` を実行する。
1. `MyPkg` というパッケージを作ると仮定すると、現段階で以下のようなディレクトリ構造ができているはず。

```bash
(省略)/LearnTravisCI
│  julia_package_template.jl
│  README.md <- このファイル
│
└─MyPkg
    │  .gitignore
    │  .travis.yml
    │  LICENSE
    │  Manifest.toml
    │  Project.toml
    │  README.md
    │
    ├─.github
    │  └─workflows
    │          CompatHelper.yml
    │          TagBot.yml
    │
    ├─docs
    │  │  make.jl
    │  │  Manifest.toml
    │  │  Project.toml
    │  │
    │  └─src
    │         index.md
    │
    ├─src
    │       MyPkg.jl
    │
    └─test
            runtests.jl
```

## ドキュメントの生成
1. `startup.jl` に `push!(LOAD_PATH, "(省略)/LearnTravisCI/MyPkg/src")` と記入する。
1. `>julia MyPkg/docs/make.jl` によってドキュメントを生成する。警告は無視。
1. `MyPkg/docs` の中に `build` が生成されたはず。

```bash
(省略)/LearnTravisCI
│  julia_package_template.jl
│  README.md
│
└─MyPkg
    │  .gitignore
    │  .travis.yml
    │  LICENSE
    │  Manifest.toml
    │  Project.toml
    │  README.md
    │
    ├─.github
    │  └─workflows
    │          CompatHelper.yml
    │          TagBot.yml
    │
    ├─docs
    │  │  make.jl
    │  │  Manifest.toml
    │  │  Project.toml
    │  │
    │  ├─build
    │  │  │  index.html
    │  │  │  search.html
    │  │  │  search_index.js
    │  │  │
    │  │  └─assets
    │  │      │  documenter.js
    │  │      │  search.js
    │  │      │  themeswap.js
    │  │      │
    │  │      └─themes
    │  │              documenter-dark.css
    │  │              documenter-light.css
    │  │
    │  └─src
    │          index.md
    │
    ├─src
    │      MyPkg.jl
    │
    └─test
            runtests.jl
```

`julia -e "using LiveServer; serve(dir=\"MyPkg/docs/build\")"`
を実行し、ブラウザで `localhost:8000` を開くと、ドキュメントが閲覧できる。
ちなみに、Web で調べると
`julia -e 'using LiveServer; serve(dir="MyPkg/docs/build")'`
で行けると書いてあるが、少なくともWindowsでは動かなかった。
この辺はOSに依存しているかも。
いずれにせよ、以下のようなページが表示されていれば成功である。

![こんなん](home_document.png)
