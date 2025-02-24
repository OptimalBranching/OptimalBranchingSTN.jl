using OptimalBranchingSTN
using Documenter

DocMeta.setdocmeta!(OptimalBranchingSTN, :DocTestSetup, :(using OptimalBranchingSTN); recursive=true)

makedocs(;
    modules=[OptimalBranchingSTN],
    authors="XuanzhaoGao <arrogantgao@outlook.com> and contributors",
    sitename="OptimalBranchingSTN.jl",
    format=Documenter.HTML(;
        canonical="https://ArrogantGao.github.io/OptimalBranchingSTN.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/ArrogantGao/OptimalBranchingSTN.jl",
    devbranch="main",
)
