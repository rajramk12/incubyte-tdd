	class NegativeNumbersException < StandardError
		attr_reader :negative_nums
		def initialize(nums)
			@negative_nums = nums
		  super("Negative numbers found #{nums}")
		end
	end

class StringCalculator
	def add(nums)
		out = 0 
		negative_nums = []
		return out if nums.size < 1

		delimiters = ["\n", ","]
		
		if nums[0..1] == "//"
			delimiters << nums[2]
			delimiters << nums[0..1]
		end

		pattern = Regexp.new(delimiters.to_s)

		nums = nums.split(pattern).reject(&:empty?).map {|num| Integer(num)}

		nums.each do |num|
			negative_nums << num && next if num.negative?
			next if num > 1000
			out += num
		end
		
		raise NegativeNumbersException.new(negative_nums)  if negative_nums.size > 0 

		return out
	end
end
