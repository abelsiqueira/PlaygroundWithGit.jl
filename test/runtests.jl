"""
Before running this, you might have to run in the Julia REPL:
using Pkg
Pkg.instantiate()
"""

using PlaygroundWithGit
using Test

@testset "PlaygroundWithGit.jl" begin
  x, fx = loan_interest_calculator(500_000.0, 360, 2700.0; verbose = true, rtol = 1e-12, atol = 1e-12)
  @test x ≈ 0.0042 atol = 1e-5
  @test fx ≈ 0 atol = 1e-5
end
