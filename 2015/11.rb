LETTERS = 'abcdefghijklmnopqrstuvwxyz'
BASE_26 = '0123456789abcdefghijklmnop'

FORBIDDEN = /[8be]/
DOUBLE_REPEAT = /(.)\1.*(.)\2/
ABC = /012|123|234|345|456|fgh|ghi|hij|ijk|jkl|klm|lmn|mno|nop/

def solve(input)
  n = input.tr(LETTERS, BASE_26).to_i 26
  loop do
    n += 1
    password = n.to_s 26
    if !password.match?(FORBIDDEN) && password.match?(DOUBLE_REPEAT) && password.match?(ABC)
      break
    end
  end
  n.to_s(26).tr(BASE_26, LETTERS)
end

password1 = solve 'hxbxwxba'
puts password1

puts solve password1