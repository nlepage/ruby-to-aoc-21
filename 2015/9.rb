def solve(input)
  connections = input.split("\n").map { |line| towns, dist = line.split(' = '); from, to = towns.split(' to '); [from, to, dist.to_i] }

  towns = connections.flat_map { |connection| connection[0..1] }.uniq
  distances = connections.flat_map { |from, to, dist| [[from + to, dist], [to + from, dist]] }.to_h
  
  p towns.permutation.map { |path| path[...path.length-1].each_with_index.inject(0) { |dist, from| dist + distances[from[0]+path[from[1]+1]] } }.minmax
end

TEST = <<~EOF
London to Dublin = 464
London to Belfast = 518
Dublin to Belfast = 141
EOF

solve TEST

INPUT = <<~EOF
AlphaCentauri to Snowdin = 66
AlphaCentauri to Tambi = 28
AlphaCentauri to Faerun = 60
AlphaCentauri to Norrath = 34
AlphaCentauri to Straylight = 34
AlphaCentauri to Tristram = 3
AlphaCentauri to Arbre = 108
Snowdin to Tambi = 22
Snowdin to Faerun = 12
Snowdin to Norrath = 91
Snowdin to Straylight = 121
Snowdin to Tristram = 111
Snowdin to Arbre = 71
Tambi to Faerun = 39
Tambi to Norrath = 113
Tambi to Straylight = 130
Tambi to Tristram = 35
Tambi to Arbre = 40
Faerun to Norrath = 63
Faerun to Straylight = 21
Faerun to Tristram = 57
Faerun to Arbre = 83
Norrath to Straylight = 9
Norrath to Tristram = 50
Norrath to Arbre = 60
Straylight to Tristram = 27
Straylight to Arbre = 81
Tristram to Arbre = 90
EOF

solve INPUT
