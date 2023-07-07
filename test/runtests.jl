using PlaygroundWithGit
using Test

@testset "PlaygroundWithGit.jl" begin
  x, fx = loan_interest_calculator(500_000.0, 360, 2700.0)
  @test x ≈ 0.0042 atol = 1e-5
  @test fx ≈ 0 atol = 1e-5
end
