	class NegativeNumbersException < StandardError
		def initialize(nums)
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

		nums = nums.split(pattern).reject(&:empty?)

		nums.each do |num|
			negative_nums << num if Integer(num).negative?
			out += Integer(num)
		end
		
		raise NegativeNumbersException.new(negative_nums)  if negative_nums.size > 0 

		return out
	end
end
