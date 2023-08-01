module PlaygroundWithGit

using Plots, Printf
export loan_interest_calculator

"""
loan_interest_calculator()

Uses loan_amount, number_of_payments, and monthly_payment and does zero-finding method to calculate interest_rate

"""
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

  function print_iteration(a, b, fa, f_upper)
    @info @sprintf("| %+12.5e | %+12.5e | %+12.5e | %+12.5e |\n", a, b, fa, f_upper)
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

  lower = 0.0
  upper = monthly_payment / loan_amount
  f_lower, f_upper = f(lower), f(upper)
  solution = (lower + upper) / 2
  f_solution = f(solution)
  ϵ = max(abs(f_lower), abs(f_upper), abs(f_solution)) * rtol + atol

  if verbose
    print_header()
    print_iteration(lower, upper, f_lower, f_upper)
  end

  while abs(f_solution) > ϵ || (upper - lower) > atol
    if f_lower * f_solution < 0
      upper = solution
      f_upper = f_solution
    else
      lower = solution
      f_lower = f_solution
    end
    solution = (lower + upper) / 2
    f_solution = f(solution)
    if verbose
      print_iteration(lower, upper, f_lower, f_upper)
    end
  end

  if verbose
    print_footer()
  end

  return solution, f_solution
end

end
