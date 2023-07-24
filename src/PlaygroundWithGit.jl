module PlaygroundWithGit

using Plots
export loan_interest_calculator

function loan_interest_calculator()
  borrowed_amount = 500_000.0
  number_of_payments = 360
  monthly_payment = 2700.0

  function target_function(interest_rate)
    if interest_rate == 0
      return monthly_payment - borrowed_amount / number_of_payments
    else
      return monthly_payment -
             interest_rate * borrowed_amount /
             (1 - 1 / (1 + interest_rate)^number_of_payments)
    end
  end

  plot(
    i -> i * borrowed_amount / (1 - 1 / (1 + i)^number_of_payments),
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
  while abs(fx) > 1e-6 || (b - a) > 1e-6
    if fa * fx < 0
      b = x
      fb = fx
    else
      a = x
      fa = fx
    end
    x = (a + b) / 2
    fx = f(x)
  end

  return x, fx
end

end
