class CaloryCounting

  def input_string
    File.read("calory_counting_input.txt")
  end

  def max_calories
    total_calories_per_elf_array.max
  end

  def total_calories_per_elf_array
    input_string.split("\n\n").map{|i| i.split("\n").map(&:to_i).sum }
  end

  def top_three_elves_sum
    total_calories_per_elf_array.sort.last(3).sum
  end
end

p CaloryCounting.new().max_calories
p CaloryCounting.new().top_three_elves_sum