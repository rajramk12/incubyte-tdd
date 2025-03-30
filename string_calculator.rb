class StringCalculator
	def add(nums)
		out = 0 
		return out if nums.size < 1

		nums = nums.split(',')

		nums.each do |num|
			out += Integer(num)
		end

		return out
	end
end
