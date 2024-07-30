require "string_calculator"

describe StringCalculator do
  describe '#add' do
    context 'when input string is empty' do
      it 'returns 0' do
        result = StringCalculator.new.add('')
        expect(result).to eq(0)
      end
    end
  end
end