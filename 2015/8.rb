def decode(string)
  string.sub(/^"/, '').sub(/"$/, '').gsub(/\\"/, '"').gsub(/\\x[0-9a-f]{2}/, 'x').gsub(/\\{2}/, '\\')
end

def encode(string)
  '"' + string.gsub(/\\/, 'xx').gsub(/"/, '\\"') + '"'
end

def solve(input)
  p input.split("\n").map { |line| line.length - decode(line).length }.sum
  p input.split("\n").map { |line| encode(line).length - line.length }.sum
end

solve File.open(File.dirname(__FILE__) + '/8-test.txt').read
solve File.open(File.dirname(__FILE__) + '/8-input.txt').read
