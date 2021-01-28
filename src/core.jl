geosum(r::Real, n::Integer) = (1 - r^(n + 1)) / (1 - r)
geosum(a::Real, r::Real, n::Integer) = a * geosum(r, n)

monthly_rate(annual_rate::Real) = (1 + annual_rate) ^ (1/12) - 1
 
"""
Future value. Assumes payments at the beginning of the month.
"""
function fv(monthly_payment::Real, annual_rate::Real; months::Integer=0,
            init::Real=0, years::Integer=0)
  months == 0 && (months = years * 12)

  r = monthly_rate(annual_rate)
  init_future = init * (1 + r) ^ months
  return geosum(monthly_payment, 1 + r, months) - monthly_payment + init_future
end

"""
Computes monthly payments. Assumes payments at the beginning of the month.
"""
function monthly_payment(goal::Real, annual_rate::Real; months::Integer=0,
                         years::Integer=0, init::Real=0)
  months == 0 && (months = years * 12)
  r = monthly_rate(annual_rate)
  init_future = init * (1 + r) ^ months
  return (goal - init_future) / (geosum(1 + r, months) - 1)
end

hell() = 1
