class StringCalculator
  def add(input)
    if input.empty?
      0
    else
      if input.start_with?("//")
        delimiter = input.split('\n')[0][3..-2]
        numbers = input.split('\n')[1].split("#{delimiter}").map{|n| n.to_i}
      else
        numbers = input.split(/[',','\\n']/).map{|n| n.to_i}
      end

      filtered_numbers = numbers.select{ |n| n <= 1000 }
      raise ArgumentError, "negatives not allowed" if numbers.any? { |num| num < 0 }
      filtered_numbers.sum
    end
  end
end