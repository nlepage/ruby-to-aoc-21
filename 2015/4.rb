require 'digest'

INPUT = 'ckczppom'

def solve(prefix)
  p (1..).find { |i| Digest::MD5.hexdigest(INPUT+i.to_s).start_with? prefix }
end

solve '00000'
solve '000000'
