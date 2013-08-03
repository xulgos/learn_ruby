def measure loops=1
  loops.times.map do
    start = Time.now
    yield
    Time.now.to_f - start.to_f
  end.reduce(:+)/loops
end
