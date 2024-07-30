class StringCalculator
  def add(input)
    if input.empty?
      0
    else
      numbers = input.split(',').map{|n| n.to_i}
      numbers.sum
    end
  end
end