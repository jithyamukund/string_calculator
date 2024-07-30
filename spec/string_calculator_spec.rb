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

    context 'two numbers' do
      context "when input string is 1,5" do
        it 'returns 6' do
          result = StringCalculator.new.add('1,5')
          expect(result).to eq(6)
        end
      end

      context "when input string is 20,100" do
        it 'returns 120' do
          result = StringCalculator.new.add('20,100')
          expect(result).to eq(120)
        end
      end

      context "when input string is 11,0" do
        it 'returns 11' do
          result = StringCalculator.new.add('11,0')
          expect(result).to eq(11)
        end
      end
    end
  end
end