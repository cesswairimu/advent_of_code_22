# rock paper scissors strategy
require 'pry'
class RpsStrategy
  
  H1 = {"A": "rock", "B": "paper", "C": "scissors" }
  H2 = {"X": "rock", "Y": "paper", "Z": "scissors" }
  H3 = {"X": 1, "Y": 2, "Z": 3 }
  H5 = {"X": "C", "Z": "B", "Y": "A" }
  


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
end

def preload_score
end

p RpsStrategy.new().score_per_round(["A", "Y"])
p RpsStrategy.new().score_per_round(["B", "X"])
p RpsStrategy.new().score_per_round(["C", "Z"])
p RpsStrategy.new().play