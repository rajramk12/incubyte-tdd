require 'minitest\autorun'
require_relative 'string_calculator'
# require_relative 'exception/negative_numbers_exception'

class StringTestCalculator < Minitest::Test
	def setup
		@calc = StringCalculator.new
	end

	def test_add_blank
		assert_equal  0, @calc.add("")
	end

	def test_add_number
		assert_equal 7, @calc.add("7")
	end

	def test_add_numbers
		assert_equal 12, @calc.add("3,4,5")
	end

	def test_add_numbers_with_linespace
		assert_equal 6, @calc.add("1\n2,3")
	end

	def test_add_numbers_with_multiple_linespace
		assert_equal 21 , @calc.add("1\n2,3\n7\n8")
	end

	def test_add_numbers_with_delimiters
		assert_equal 13 , @calc.add("//;\n1;2;4;6")
	end

	def test_add_numbers_with_diff_delimiters
		assert_equal 13, @calc.add("//:\n1:2:4:6")
	end

	def test_add_numbers_with_diff_delimiters_2
		assert_equal 13, @calc.add("//|\n1|2|4|6")
	end

	def test_add_negative_numbers
		assert_raises(NegativeNumbersException) { @calc.add("-1,2,3,4,6") }
	end

	def test_add_multiple_negative_numbers
		negative_nums = [-6,-4] 
		exception = assert_raises(NegativeNumbersException) { @calc.add("2,4,-6,-4") }
		assert_equal exception.negative_nums, negative_nums
	end

	def test_add_numbers_gte_1000
		assert_equal 6, @calc.add("1\n2,3,1001,2000")
	end

	def test_add_numbers_different_delimiters_in_same_string
		assert_equal 6, @calc.add("//[*][%]\n1*2%3")
	end

	def test_add_numbers_multichar_delimiters
		assert_equal 12, @calc.add("//[***][%]\n1***2***3%6")
	end
end