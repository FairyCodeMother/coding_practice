# This controller contains all the ways to work with passed arrays
class ManipulateArrayController < ApplicationController

	def find_value(array, target)
		response = ""
		array.each { |element| element == target ? response = "Using each: #{element}" : response = "Using each: not found" }
		puts response

		puts "Using include?: #{array.include?(target)}"

		new_array = array.map{ |element| element == target }
		puts "Using map: #{new_array}"
	end


	def reverse(array)
		# via iteration with new array: O(n)
		new_arr = []
		for index in 1..array.size
			new_arr[index-1] = array[array.size-index]
		end
		puts "Using iteration with new array: #{new_arr.join(', ')}"

		# via swap-in-place: O(n)
		new_arr = array
		for index in 0..(new_arr.size/2)
			temp = new_arr[index]        						# get from the front
			new_arr[index] = new_arr[new_arr.size-index-1]		# replace with the back
			new_arr[new_arr.size-index-1] = temp				# set the temp as new back
		end
		puts "Using swap-in-place: #{new_arr.join(', ')}"
		return new_arr.join(', ')
	end


	def return_dupes(array)
		puts "in return_dupes"
		# nested loop: O(n^2)
		new_arr = []
		array.each_with_index do |val, ind|
			array.each_with_index do |new_val, index|
				new_arr.push(new_val) if val == new_val && index != ind
			end
		end
		new_arr.uniq!
		puts "Using nested loop: #{new_arr.join(', ')}"

		# still a nested loop: O(n^2)
		new_arr = []
		array.each_with_index do |val, ind|
			new_arr.push(val) if array[ind+1..-1].include?(val) && !new_arr.include?(val)
		end
		puts "Using nested include? loop: #{new_arr.join(', ')}"

		# increment count in a hash: 2xO(n) = O(n)
		new_hash = Hash.new(0)
		new_arr = []
		array.each do |value|
			new_hash[value] += 1
		end		
		new_hash.each do |value, count|
			new_arr.push(value.to_i) if count > 1
		end
		puts "Using loop to a hash[number, count]: #{new_arr.join(', ')}"

		return new_arr.join(", ")
	end



	def rand_arr(size, max_val)
		new_arr = []
		for i in 1..size
			new_arr.push(rand(max_val))
		end
		puts "Using 'for i in 1..size': new_arr.push(rand(max_val)): #{new_arr.join(', ')}"

		new_arr = size.times.map{ rand(max_val)}
		puts "Using 'size.times.map{ rand(max_val)}': #{new_arr.join(', ')}"
		return new_arr.join(', ')
	end




	def remove_dupes(array)
		new_arr = []
		for i in array do 
			new_arr.push(array[i]) if array[i..-1].include?(array[i])
		end


	end

end