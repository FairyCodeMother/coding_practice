class DriverController < ApplicationController
	require 'json'

	def index
		result = nil		

		#TODO: replace this with something better
		unless params["reverse"].nil? || params["reverse"].empty?
			result = reverse_string(params["reverse"])
		end
		unless params["reverse_arr"].nil? || params["reverse_arr"].empty?
			array = params["reverse_arr"].split(/\s*,\s*/)
			result = ManipulateArrayController.new.reverse(array)
		end
		unless params["fizz"].nil? || params["fizz"].empty?
			result = fizzbuzz(params["fizz"].to_i)
		end
		unless params["sum"].nil? || params["sum"].empty?
			num_array = JSON.parse(params["sum"].split(";").first)
			target = params["sum"].split(";").last.strip.to_i
			result = sum(num_array, target)
		end
		unless params["linked"].nil? || params["linked"].empty?
			result = linked(JSON.parse(params["linked"]))
		end		
		unless params["rand_arr"].nil? || params["rand_arr"].empty?
			size = params["rand_arr"].split(",").first.strip.to_i
			max_val = params["rand_arr"].split(",").last.strip.to_i
			result = rand_arr(size, max_val)
		end		
		unless params["return_dupes"].nil? || params["return_dupes"].empty?
			array = params["return_dupes"].split(/\s*,\s*/)
			result = ManipulateArrayController.new.return_dupes(array)
		end

		flash[:result] = result.nil? ? nil : "FINAL RESULT:    #{result}"
	end

	# Return the reverse for a given String
	def reverse_string(word)
		new_string_array = Array.new(word.size)
		index = 1
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

	# For the given array, create a singly LinkedList
	def linked(values)
		new_ll = LinkedList.new(values)
	end

	#Make an array of size filled with random values. The max value of the random numbers must <= max_val
	def rand_arr(size, max_val)
		# naive way
		# new_arr = Array.new
		# i = 0
		# while i < size
		# 	new_arr.push(rand(max_val))
		# 	i += 1
		# end
		# new_arr.join(", ")

		# cool way
		new_arr = size.times.map{ rand(max_val)}
		new_arr.join(", ")
	end

end















