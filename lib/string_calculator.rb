class StringCalculator
  def add(input)
    if input.empty?
      0
    else
      if input.start_with?("//")
        delimiter = input.split('\n')[0][2..-1]
        numbers = input.split('\n')[1].split("#{delimiter}").map{|n| n.to_i}
      else
        numbers = input.split(/[',','\\n']/).map{|n| n.to_i}
      end
      numbers.sum
    end
  end
end