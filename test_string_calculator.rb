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

end
