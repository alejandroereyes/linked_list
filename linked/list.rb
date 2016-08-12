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
      if_empty_make_head_n_tail_this node
    end

    def prepend(node)
      # adds node to start of list
      if_empty_make_head_n_tail_this node
    end

    def tail
     head && @tail.nil? ? head : @tail
    end

    def pop
      # removes last node
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

    def empty?
      head.nil? && tail.nil?
    end

    def insert_at(index)

    end

    def remove_at(index)

    end

    def if_empty_make_head_n_tail_this(node)
      if empty? || head && !tail
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
letters_arr =  letters.each_with_object([]) do |letter, arr|
  arr << Linked::Node.new(letter)
end

puts "#{linky.inspect}"

# 1.times do
  # binding.pry
# end
