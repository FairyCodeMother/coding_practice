
# A LinkedList is made of Nodes
# Every Node has a value and next attribute
class Node

	attr_accessor :value, :next

	def initialize(value=nil)
		puts "I am #{value}"
		@value = value
		@next = nil
	end

end