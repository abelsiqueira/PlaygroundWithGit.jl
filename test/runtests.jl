using PlaygroundWithGit
using Test

@testset "PlaygroundWithGit.jl" begin
  x, fx = loan_interest_calculator(; verbose = true)
  @test x ≈ 0.0042 atol = 1e-5
  @test fx ≈ 0 atol = 1e-5
end
