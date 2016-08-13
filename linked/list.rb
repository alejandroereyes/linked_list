require_relative 'node'
module Linked
  class List
    attr_reader :head, :tail

    def initialize
      @head = nil
      @tail = nil
    end

    def append(node)
      # adds node to end of list
      if if_empty_make_head_n_tail_this node
        node
      else
        node.next_node = nil
        tail.next_node = node
        @tail          = node
      end
    end
    alias_method :<<, :append

    def prepend(node)
      # adds node to start of list
      if if_empty_make_head_n_tail_this node
        node
      else
        node.next_node = head
        @head          = node
      end
    end

    def size
      # total number of nodes in list
      return 0 if empty?
      size = 0
      each { size += 1 }
      size
    end

    def at(index)
      # returns node at the given index
      each_with_index do |node, current_index|
        return node if current_index == index
      end
    end

    def pop
      # removes last node
      each_with_index_n_previous do |node, current_index, previous_node|
        next if node.next_node

        previous_node.next_node = nil
        @tail                   = previous_node
      end
    end

    def contains?(value)
      # true or false if value is contained in one of the nodes
      !!find(value)
    end

    def find(value)
      # returns index of node containing the data
      each_with_index do |node, current_index|
        return current_index if node.value == value
      end
    end

    def to_s
      # formats a string of the list: (value) -> (value) -> (value) -> nil
      return if empty?
      str = ""
      each do |node|
        str << "(#{node.value}) -> "
        str << "nil" if node.next_node.nil?
      end
      str
    end

    def insert_value_at(index, data)
      # inserts the data at the given index
      each_with_index do |node, current_index|
        node.value = data and break if current_index == index
      end
    end

    def insert_node_at(index, new_node)
      # insert the node at the given index
      each_with_index_n_previous do |node, current_index, previous_node|
        next unless current_index == index

        new_node.next_node      = node
        previous_node.next_node = new_node
      end
    end

    def remove_at(index)
      # removes node at the given index
      each_with_index_n_previous do |node, current_index, previous_node|
        next unless current_index == index

        previous_node.next_node = node.next_node
        @tail = previous_node if node == @tail
        return node
      end
    end

    private
    def each(node=@head, &block)
      yield node
      each(node.next_node, &block) if node.next_node
    end

    def each_with_index(&block)
      index = 0
      each do |node|
        yield node, index
        index += 1
      end
    end

    def each_with_index_n_previous(&block)
      previous_node = nil
      each_with_index do |node, current_index|
        yield node, current_index, previous_node
        previous_node = node
      end
    end

    def empty?
      head.nil? && tail.nil?
    end

    def if_empty_make_head_n_tail_this(node)
      if empty?
        @head = node
        @tail = node
      end
    end
  end
end

linky = Linked::List.new
letters = ['a', 'f', 'x', 'o', 'n']
arr =  letters.each_with_object([]) do |letter, arr|
  arr << Linked::Node.new(letter)
end
linky << arr.first
linky << arr[1]
linky << arr[2]

puts "Three nodes added to list:\nHEAD: #{arr.first.inspect}\nMIDDLE: #{arr[1].inspect}\nTAIL: #{arr[2].inspect}\n\n"
puts "LIST: #{linky.inspect}"
puts "\nINITIAL STATS:\n"
puts "\n Size: #{linky.size}"
puts " Has letter x: #{linky.contains?('x')}"
puts " Find index for 'f' value node: #{linky.find('f').inspect}"
puts " Format to_s: #{linky.to_s}"
puts " Get node at index 1: #{linky.at(1).inspect}\n"
puts "\n-------------------------------\n"
linky.pop
puts "\n Pop last item. \n\n New size: #{linky.size}\n"
puts " Has letter x: #{linky.contains?('x')}"
puts " Has letter a: #{linky.contains?('a')}"
puts " Next order: #{linky.to_s}\n"
puts "\n-------------------------------\n"
linky.insert_value_at(0, 'z')
puts "\n Inserted 'z' into head value. \n"
puts "\n New Order: #{linky.to_s}"
puts " Does list have letter z: #{linky.contains?('z')}"
puts "\n-------------------------------\n"
linky << arr[3]
puts "\n Added node with 'o' value to tail\n"
puts "\n Size: #{linky.size}\n New Order:#{linky.to_s}"
puts "\n-------------------------------\n"
linky.remove_at(1)
puts "\n Removed node at index 1 with value of 'f'\n"
puts "\n Size: #{linky.size}\n New Order: #{linky.to_s}"
puts "\n-------------------------------\n"
linky.insert_node_at(1, arr.last)
puts "\n Inserting node with value 'n' at index 1\n\n"
puts " New Order: #{linky.to_s}"
