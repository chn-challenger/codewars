def sale_hotdogs(n)
  return 100 * n if  n < 5
  return 95 * n if 5 <= n && n < 10
  return 90 * n if 10 <= n
end