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

      context "when input string is seperated by \\n " do
        it 'returns 31' do
          result = StringCalculator.new.add('11\n20')
          expect(result).to eq(31)
        end

        it 'returns 11 when included 0 in input string' do
          result = StringCalculator.new.add('11\n0')
          expect(result).to eq(11)
        end

      end
    end

    context "n numbers" do
      context "when input string is '2,4,6,7'" do
        it 'returns 19' do
          result = StringCalculator.new.add('2,4,6,7')
          expect(result).to eq(19)
        end
      end

      context "when input string is '2,4,6,7,10,100,1000'" do
        it 'returns 1129' do
          result = StringCalculator.new.add('2,4,6,7,10,100,1000')
          expect(result).to eq(1129)
        end
      end

      context "when input string has 0 " do
        it "returns 9 when input is '2,0,0,7'" do
          result = StringCalculator.new.add('2,0,0,7')
          expect(result).to eq(9)
        end
      end

      context "when input string is seperated by \\n " do
        it 'returns 141' do
          result = StringCalculator.new.add('11\n20,100\n10')
          expect(result).to eq(141)
        end

        it 'returns 133 when included 0 in input string' do
          result = StringCalculator.new.add('11\n20,100\n0\n1,1')
          expect(result).to eq(133)
        end
      end
    end
  end
end