using Documenter, PlaygroundWithGit

DocMeta.setdocmeta!(
  PlaygroundWithGit,
  :DocTestSetup,
  :(using PlaygroundWithGit);
  recursive = true,
)

makedocs(;
  modules = [PlaygroundWithGit],
  doctest = true,
  linkcheck = false,
  authors = "Abel Soares Siqueira <abel.s.siqueira@gmail.com>",
  repo = "https://github.com/abelsiqueira/PlaygroundWithGit.jl/blob/{commit}{path}#{line}",
  sitename = "PlaygroundWithGit.jl",
  format = Documenter.HTML(;
    prettyurls = get(ENV, "CI", "false") == "true",
    canonical = "https://abelsiqueira.github.io/PlaygroundWithGit.jl",
  ),
  pages = [
    "Home" => "index.md",
    "Reference" => "reference.md",
    "Tutorials" => "tutorials.md",
  ],
)

deploydocs(; repo = "github.com/abelsiqueira/PlaygroundWithGit.jl", push_preview = false)
