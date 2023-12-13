def solve(input, n)
  p n.times.inject(input) { |s| s.gsub(/(.)\1*/) { "#{$&.length}#{$1}" } }.length
end

solve('1', 5)
solve('1321131112', 40)
solve('1321131112', 50)