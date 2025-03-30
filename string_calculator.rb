class StringCalculator
	def add(nums)
		out = 0 
		return out if nums.size < 1

		delimiters = ["\n", ","]
		
		if nums[0..1] == "//"
			delimiters << nums[2]
			delimiters << nums[0..1]
		end

		pattern = Regexp.new(delimiters.to_s)

		nums = nums.split(pattern).reject(&:empty?)

		nums.each do |num|
			out += Integer(num)
		end

		return out
	end
end
