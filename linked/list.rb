require 'pry'
require_relative 'node'
require 'forwardable'
module Linked
  class List
    extend Forwardable
    attr_accessor :list
    delegate [:empty?, :size] => :list
    # list will contain nodes as elements, each node contains its own value &
    # a next_node pointer that is equal to the following node's index

    def initialize
      @list = []
    end

    def append(node)
      # adds node to end of list
      empty_list_will_insert_this node
    end

    def prepend(node)
      # adds node to start of list
      empty_list_will_insert_this node
    end

    def head
      # first node in list
      list.first
    end

    def tail
      # last node in list
      list.last
    end

    def at(index)
      # node at the given index
      list[index]
    end

    def pop
      # removes last node
      list.pop if size == 1
    end

    def contains?(value)
      # true or false if value is contained in one of the nodes
    end

    def find(value)
      # returns index of node containing the data
    end

    def to_s
      # formats a string of the list: (value) -> (value) -> (value) -> nil
    end

    def insert_at(index)
      # inserts the value at the given index
      empty_list_will_insert_this node
    end

    def remove_at(index)
      # removes the node at the given index
    end

    def empty_list_will_insert_this(node)
      list << node if empty?
    end

    def each(&block)
      (0...list.length).each do |i|
        next_item = list[i].next_node
        if list[i] == head
          yield list[i]
        else
          yield list[next_item]
        end
      end
    end
  end
end

linky = Linked::List.new
new_arr =  (1...11).to_a.each_with_object([]) do |n, arr|
  arr << Linked::Node.new(n, n)
end
linky.list = new_arr
puts "#{linky.inspect}"

# 1.times do
  # binding.pry
# end
