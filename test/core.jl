@testset "core" begin
  mp = 100
  a = fv(mp, .1, years=10, init=123)
  @test monthly_payment(a, .1, years=10, init=123) ≈ mp atol=.001
end
