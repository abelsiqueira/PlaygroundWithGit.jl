module PlaygroundWithGit

using Plots, Printf
export loan_interest_calculator

function loan_interest_calculator(; verbose = false, atol = 1e-6, rtol = 1e-6)
  loan_amount = 500_000.0
  number_of_payments = 360
  monthly_payment = 2700.0

  function target_function(interest_rate)
    if interest_rate == 0
      return monthly_payment - loan_amount / number_of_payments
    else
      return monthly_payment -
             interest_rate * loan_amount / (1 - 1 / (1 + interest_rate)^number_of_payments)
    end
  end

  function print_header()
    @info "┌──────────────┬──────────────┬──────────────┬──────────────┐"
    @info "│ a            │ b            │ f(a)         │ f(b)         │"
    @info "├──────────────┼──────────────┼──────────────┼──────────────┤"
  end

  function print_iteration(a, b, fa, fb)
    @info @sprintf("| %+12.5e | %+12.5e | %+12.5e | %+12.5e |\n", a, b, fa, fb)
  end

  function print_footer()
    @info "└──────────────┴──────────────┴──────────────┴──────────────┘"
  end

  plot(
    i -> i * loan_amount / (1 - 1 / (1 + i)^number_of_payments),
    0,
    0.02;
    lab = "predicted monthly payment",
  )
  plot!(i -> monthly_payment, 0, 0.02; lab = "actual monthly payment")
  png("viz")

  f(x) = target_function(x)

  a = 0.0
  b = 1.0
  fa, fb = f(a), f(b)
  x = (a + b) / 2
  fx = f(x)
  ϵ = max(abs(fa), abs(fb), abs(fx)) * rtol + atol

  if verbose
    print_header()
    print_iteration(a, b, fa, fb)
  end

  while abs(fx) > ϵ
    if fa * fx < 0
      b = x
      fb = fx
    else
      a = x
      fa = fx
    end
    x = (a + b) / 2
    fx = f(x)
    if verbose
      print_iteration(a, b, fa, fb)
    end
  end

  if verbose
    print_footer()
  end

  return x, fx
end

end
