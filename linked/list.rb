require 'pry'
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
      @size = 0
      head_to_tail { @size += 1 }
      @size
    end

    def pop
      # removes last node
      tail_pointer           = get_pointer_to_tail
      tail_pointer.next_node = nil
      @tail                  = tail_pointer
    end

    def contains?(value)
      # true or false if value is contained in one of the nodes
      @contains_value = false
      head_to_tail { |node| @contains_value = true and break if node.value == value }
      @contains_value
    end

    def find(value)
      # returns index of node containing the data
      head_to_tail { |node| return node if node.value == value }
    end

    def to_s
      # formats a string of the list: (value) -> (value) -> (value) -> nil
      return if empty?
      @str = ""
      head_to_tail do |node|
        @str << "(#{node.value}) -> "
        @str << "nil" if node.next_node.nil?
      end
      @str
    end

    def insert(node)

    end

    def remove(node_or_value)

    end

    private
    def head_to_tail(node=@head, &block)
      if block_given?
        yield node
        head_to_tail(node.next_node, &block) if node.next_node
      else
        head_to_tail node.next_node if node.next_node
      end
    end

    def get_pointer_to_tail
      return node if node.next_node == tail
      head_to_tail { |node| return node if node.next_node == tail }
    end

    def empty?
      head.nil? && tail.nil?
    end

    def if_empty_make_head_n_tail_this(node)
      if empty?
        @head = node
        @tail = node
        return node
      end
      false
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

puts "#{linky.inspect}"
puts "\n Size: #{linky.size}\n"
puts "\n Has letter x: #{linky.contains?('x')}\n"
puts "\n Find f: #{linky.find('f').inspect}\n"
puts "\n Format to_s: #{linky.to_s}\n"
linky.pop
puts "\n Pop last item, check size: #{linky.size}\n"
puts "\n #{linky.inspect}\n"

1.times do
  # binding.pry
end
