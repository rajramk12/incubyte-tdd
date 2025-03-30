require 'minitest\autorun'
require_relative 'string_calculator'
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
end
