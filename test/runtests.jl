using PlaygroundWithGit
using Test

@testset "PlaygroundWithGit.jl" begin
  borrowed_amount = 500_000.0
  number_of_payments = 360
  monthly_payment = 2700.0
  x, fx = loan_interest_calculator(borrowed_amount, number_of_payments, monthly_payment)
  @test x ≈ 0.0042 atol = 1e-5
  @test fx ≈ 0 atol = 1e-5
end
