# A LinkedList is a linear data structure that is not contiguously stored
# A LinkedList is made of Nodes
class LinkedList

	attr_reader :size
	attr_accessor :head

	# Each LinkedList is begun once and starts at size 0 if no value is passed
	def initialize(value=nil)
		puts "starting a new LL"
		@size = 0
		add(value) if value
	end

	# Add value to the end and increment size
	def push(value)
		return if value.nil?
		if @head.nil?
			add(value)
		else
			last = get_last_node
			last.next = Node.new(value)
			@size += 1
		end				
	end

	# Remove the last Node and return the value
	def pop_last
		return if size < 1
		previous = nil
		current = @head

		if current.next.nil?
			@head = nil
		else
			while !current.next.nil?
				previous = current
				current = current.next
			end
		end
		previous.next = nil
		@size -= 1
		current.value
	end

private

	# The first Node is always the head
	def add(value)
		if @size == 0
			puts "Creating head node"			
			@size = 1
		else
			puts "Adding a new node"
			@next = @head.next
		end
		@head = Node.new(value)
	end

	def get_last_node
		current = @head
		while !current.next.nil?
			current = current.next
		end
		current
	end
end


# class LinkedList

#   attr_reader :size

#   def initialize(value=nil)
#     @size = 0
#     add_value(value) if value
#   end

#   def push(value)
#     if @head
#       node = @head

#       while node.next != nil do
#         node = node.next
#       end

#       node.next = Node.new(value)

#       @size += 1
#     else
#       add_value(value)
#     end
#   end

  

#   private

#   def add_value(value)
#     if @head.nil?
#       @size = 1
#     else
#       @next = @head.next
#     end
#     @head = Node.new(value)
#   end
# end