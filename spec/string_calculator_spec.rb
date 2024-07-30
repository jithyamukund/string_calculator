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

      context "when input has different delimiters" do
        it "returns 143 when delimiter is ';' " do
          result = StringCalculator.new.add('//[;]\n143')
          expect(result).to eq(143)
        end
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

      context "when input has different delimiters" do
        it "returns 143 when delimiter is ';' " do
          result = StringCalculator.new.add('//[;]\n141;2')
          expect(result).to eq(143)
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

      context "when input has default delimiters" do
        it "returns 143 when delimiter is ';' " do
          result = StringCalculator.new.add('//[;]\n11;20;100;10;1;1')
          expect(result).to eq(143)
        end

        it "returns 143 when delimiter is ',' " do
          result = StringCalculator.new.add('//[,]\n11,20,100,10,1,1')
          expect(result).to eq(143)
        end

        it "returns 143 when delimiter is '//' " do
          result = StringCalculator.new.add('//[//]\n11//20//100//10//1//1')
          expect(result).to eq(143)
        end

        it "returns 143 when delimiter is '-' " do
          result = StringCalculator.new.add('//[-]\n11-20-100-10-1-1')
          expect(result).to eq(143)
        end

        it "returns 143 when delimiter is \" " do
          result = StringCalculator.new.add('//["]\n11"20"100"10"1"1')
          expect(result).to eq(143)
        end

        it "returns 143 when delimiter is . " do
          result = StringCalculator.new.add('//[.]\n11.20.100.10.1.1')
          expect(result).to eq(143)
        end

        it "returns 6 when delimiter is *** " do
          result = StringCalculator.new.add('//[***]\n1***2***3')
          expect(result).to eq(6)
        end
      end

      context "when input has multiple delimiters" do
        it "returns 6 when delimiters are * and % " do
          result = StringCalculator.new.add('//[*][%]\n1*2%3')
          expect(result).to eq(6)
        end
      end
    end

    context "when input string has negative numbers" do
      it "throws exception 'negatives not allowed' when input is 11,-20,100,10,1,1 " do
        expect do
          StringCalculator.new.add('//[;]\n11;-20;100;10;1;1')
        end.to raise_error(ArgumentError, "negatives not allowed")
      end

      it "throws exception 'negatives not allowed' when input is -2 " do
        expect do
          StringCalculator.new.add('-2')
        end.to raise_error(ArgumentError, "negatives not allowed")
      end

      it "throws exception 'negatives not allowed' when input is 1,-2 " do
        expect do
          StringCalculator.new.add('1,-2')
        end.to raise_error(ArgumentError, "negatives not allowed")
      end

      it "throws exception 'negatives not allowed' when input is -1001 " do
        expect do
          StringCalculator.new.add('-1001')
        end.to raise_error(ArgumentError, "negatives not allowed")
      end
    end

    context "when input string has numbers bigger than 1000" do
      it "returns 2 when input string is 2 and 1001 " do
        result = StringCalculator.new.add('//[;]\n1001;2')
        expect(result).to eq(2)
      end

      it "returns 1002 when input string is 2, 1000, 10000 and 1001 " do
        result = StringCalculator.new.add('//[;]\n1001;2;1000;10000')
        expect(result).to eq(1002)
      end

      it "returns 0 when input string is 1001 " do
        result = StringCalculator.new.add('1001')
        expect(result).to eq(0)
      end
    end
  end
end
