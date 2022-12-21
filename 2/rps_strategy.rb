# rock paper scissors strategy
require 'pry'
class RpsStrategy
  
  H1 = {"A": "rock", "B": "paper", "C": "scissors" }
  H2 = {"X": "rock", "Y": "paper", "Z": "scissors" }
  H3 = {"X": 1, "Y": 2, "Z": 3 }

  H5 = {"X": "C", "Z": "B", "Y": "A" }
  # with the second input how the round needs to end
  H4 = { "X": "loss", "Y": "draw", "Z": "win"}
  H6 = {"A": 1, "B": 2, "C": 3 }
  H7 = {"X": "C", "Z": "B", "Y": "A" }
  H8 = { "A":  "C", "B": "A", "C": "B"} 




  def input_str
    File.read("rps_strategy_input.txt")
    #"A Y\n   B X\n   C Z"
  end


  def play
    total = 0
    str_pairs_in_array.each do |i|
       total += score_per_round(i) 
    end
    total
  end

  def str_pairs_in_array
    input_str.split("\n").map{|i| i.split}
  end

  def score_per_round(arr)
    a= arr[0]
    b= arr[1]
    score = H3[b.to_sym]
    if H1[a.to_sym] == H2[b.to_sym]
      score += 3
    elsif H5[b.to_sym] == a
      score += 6
    end
    score
  end

  def preload_score(arr)
    a = arr[0]
    b = arr[1]
    score = 0
  
    if  b == "Y"
      score += H6[a.to_sym]
      score += 3
    elsif b == "X"
      score += H6[(H8[a.to_sym]).to_sym]
    elsif b=="Z"
      score += H6[H8.key(a)]
      score += 6
    end
    score
  end

  def play_part2
    total = 0
    str_pairs_in_array.each do |i|
       total += preload_score(i) 
    end
    total
  end
end




p RpsStrategy.new().score_per_round(["A", "Y"])
p RpsStrategy.new().score_per_round(["B", "X"])
p RpsStrategy.new().score_per_round(["C", "Z"])
p RpsStrategy.new().play
p RpsStrategy.new().preload_score(["A", "Y"])
p RpsStrategy.new().preload_score(["B", "X"])
p RpsStrategy.new().preload_score(["C", "Z"])
p RpsStrategy.new().play_part2

