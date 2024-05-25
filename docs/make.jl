using Documenter, PlaygroundWithGit

DocMeta.setdocmeta!(
  PlaygroundWithGit,
  :DocTestSetup,
  :(using PlaygroundWithGit);
  recursive = true,
)

const page_rename = Dict("developer.md" => "Developer docs")

function nice_name(file)
  file = replace(file, r"^[0-9]*-" => "")
  if haskey(page_rename, file)
    return page_rename[file]
  end
  return splitext(file)[1] |> x -> replace(x, "-" => " ") |> titlecase
end

makedocs(;
  modules = [PlaygroundWithGit],
  doctest = true,
  linkcheck = false,
  authors = "Abel Soares Siqueira <abel.s.siqueira@gmail.com>",
  repo = "https://github.com/abelsiqueira/PlaygroundWithGit.jl/blob/{commit}{path}#{line}",
  sitename = "PlaygroundWithGit.jl",
  format = Documenter.HTML(;
    prettyurls = true,
    canonical = "https://abelsiqueira.github.io/PlaygroundWithGit.jl",
  ),
  pages = [
    "Home" => "index.md"
    [
      nice_name(file) => file for file in readdir(joinpath(@__DIR__, "src")) if
      file != "index.md" && splitext(file)[2] == ".md"
    ]
  ],
)

deploydocs(; repo = "github.com/abelsiqueira/PlaygroundWithGit.jl", push_preview = true)
