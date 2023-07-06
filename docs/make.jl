using PlaygroundWithGit
using Documenter

DocMeta.setdocmeta!(PlaygroundWithGit, :DocTestSetup, :(using PlaygroundWithGit); recursive=true)

makedocs(;
    modules=[PlaygroundWithGit],
    authors="Abel Soares Siqueira <abel.s.siqueira@gmail.com> and contributors",
    repo="https://github.com/abelsiqueira/PlaygroundWithGit.jl/blob/{commit}{path}#{line}",
    sitename="PlaygroundWithGit.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://abelsiqueira.github.io/PlaygroundWithGit.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/abelsiqueira/PlaygroundWithGit.jl",
    devbranch="main",
)
