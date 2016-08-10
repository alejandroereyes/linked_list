module Linked
  class List
    attr_accessor :list

    def initialize
      @list = []
    end

    def append(node)
      # adds node to end of list
    end

    def prepend(node)
      # adds node to start of list
    end

    def size
      # to total number of nodes
      list.size
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
    end

    def remove_at(index)
      # removes the node at the given index
    end
  end
end
