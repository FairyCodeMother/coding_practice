class DriverController < ApplicationController


	def index

		result = nil
		puts "I AM: #{params.to_s}"

		unless params["reverse"].nil? || params["reverse"].empty?
			puts "I am going to reverse: #{params["reverse"]}"
			result = reverse_string(params["reverse"])
		end
		unless params["fizz"].nil? || params["fizz"].empty?
			puts "I am going to FizzBuzz: #{params["fizz"]}"
			result = fizzbuzz(params["fizz"].to_i)
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

    # Print each number but for multiples of 3 print "Fizz", for the multiples of 5 print "Buzz", 
    # and for numbers which are multiples of both 3 and 5 print "FizzBuzz".
	def fizzbuzz(digits)
		result = ""
		fizz = (number % 3 == 0)
		buzz = (number % 5 == 0)
		for number in 0..digits
			puts case
				when fizz && buzz then result.concat(" FizzBuzz ")
				when fizz then result.concat(" Fizz ")
				when buzz then result.concat(" Buzz ")
				else result.concat(" #{number} ")
			end
		end
		result
	end

end
