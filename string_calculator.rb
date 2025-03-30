class StringCalculator
	def add(*args)
		out = 0 
		return out if args.size < 1

		args.each do |num|
			out += num
		end
		
		return out
	end
end
