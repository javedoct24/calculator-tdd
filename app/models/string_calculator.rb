class StringCalculator
	def self.add(numbers)
		return 0 if numbers.empty?

		delimiter = ","
		if numbers.start_with?("//")
			delimiter_info, numbers = numbers.split("\n", 2)
			delimiter = delimiter_info[2..]
		end

		numbers = numbers.gsub("\n", delimiter)
		num_array = numbers.split(delimiter).map(&:to_i)

		negatives_msg = num_array.select { |num| num < 0 }
		raise "Negative numbers not allowed: #{negatives_msg.join(', ')}" if negatives_msg.any? #throw an exception error.

		num_array.sum
	end
end
