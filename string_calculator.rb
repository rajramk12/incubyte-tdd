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

		pattern = get_delimiters(nums)
		
		nums = nums.split(pattern).reject(&:empty?).map {|num| Integer(num)}

		negative_nums = nums.select(&:negative?)

		raise NegativeNumbersException.new(negative_nums)  if negative_nums.size > 0 

		nums.each do |num|
			next if num > 1000
			out += num
		end
		
		

		return out
	end

	private
		def get_delimiters(nums)
			delimiters = ["\n", ","]
			
			if nums[0..1] == "//"
				if nums[2] == '['
					delimiters << "[^a-zA-Z0-9\s]*" 
				else
					delimiters << nums[2]
				end
				delimiters << nums[0..1]
			end

			# p delimiters

			return Regexp.new(delimiters.to_s)
		end
	
end
