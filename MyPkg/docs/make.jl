using MyPkg
using Documenter

makedocs(;
    modules=[MyPkg],
    authors="tsutsui <shoppa99.nanone@hotmail.co.jp> and contributors",
    repo="https://github.com/Shoichiro-Tsutsui/MyPkg.jl/blob/{commit}{path}#L{line}",
    sitename="MyPkg.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://Shoichiro-Tsutsui.github.io/MyPkg.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/Shoichiro-Tsutsui/MyPkg.jl",
)
