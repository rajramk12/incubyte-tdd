require 'minitest\autorun'
require_relative 'string_calculator'
class StringTestCalculator < Minitest::Test
	def setup
		@calc = Calculator.new
	end

	def test_add_exists
	end
end
