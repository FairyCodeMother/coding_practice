class DriverController < ApplicationController


	def index

		result = nil
		puts "I AM: #{params.to_s}"

		if params["reverse"]
		puts "I am going to reverse: #{params["reverse"]}"
		result = reverse_string(params["reverse"])
		end

		flash[:notice] = "FINAL RESULT: #{result}"
	end

	def reverse_string(word)
		new_string_array = Array.new(word.size)
		index = 0
		while index < word.size
			new_string_array[index] = word[word.size-index]
			index += 1
		end
		new_string_array[word.size] = word[0]
		new_string_array.join()
	end

end
