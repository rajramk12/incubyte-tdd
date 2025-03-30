require 'minitest\autorun'
require_relative 'string_calculator'
class StringTestCalculator < Minitest::Test
	def setup
		@calc = StringCalculator.new
	end

	def test_add_blank
		assert_equal  0, @calc.add()
	end

	def test_add_numbers
		assert_equal 3, @calc.add(1,2)
	end
end
