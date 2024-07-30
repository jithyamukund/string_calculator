require "string_calculator"

describe StringCalculator do
  describe '#add' do
    context 'when input string is empty' do
      it 'returns 0' do
        result = StringCalculator.new.add('')
        expect(result).to eq(0)
      end
    end

    context "when input string is '1'" do
      it 'returns 1' do
        result = StringCalculator.new.add('1')
        expect(result).to eq(1)
      end
    end

    context "when input string is '5'" do
      it 'returns 5' do
        result = StringCalculator.new.add('5')
        expect(result).to eq(5)
      end
    end
  end
end