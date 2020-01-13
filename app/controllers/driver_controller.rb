class DriverController < ApplicationController
	require 'json'

	def index
		result = nil		

		#TODO: replace this with something better
		unless params["reverse"].nil? || params["reverse"].empty?
			result = reverse_string(params["reverse"])
		end
		unless params["fizz"].nil? || params["fizz"].empty?
			result = fizzbuzz(params["fizz"].to_i)
		end
		unless params["sum"].nil? || params["sum"].empty?
			num_array = JSON.parse(params["sum"].split(";").first)
			target = params["sum"].split(";").last.strip.to_i
			result = sum(num_array, target)
		end

		flash[:result] = result.nil? ? nil : "FINAL RESULT:    #{result}"
	end

	# Return the reverse for a given String
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

    # Print each number but for multiples of 3 print "Fizz", for the multiples of 5 print "Buzz", 
    # and for numbers which are multiples of both 3 and 5 print "FizzBuzz".
	def fizzbuzz(digits)
		result = ""
		for number in 1..digits
		fizz = (number % 3 == 0)
		buzz = (number % 5 == 0)
			puts case
				when fizz && buzz then result.concat(" FizzBuzz ")
				when fizz then result.concat(" Fizz ")
				when buzz then result.concat(" Buzz ")
				else result.concat(" #{number} ")
			end
		end
		result
	end

	# For the given array, return the indices that sum to the target value
	def sum(num_array, target)
		num_array.each_with_index do |value, val_index|
	        remainder = target - value
	        remainder_index = num_array.index(remainder)
	        next if remainder_index == val_index
	        return "#{val_index}, #{remainder_index}" if remainder_index
	    end
	end

end
