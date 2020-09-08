# https://launchschool.com/lessons/c0400a9c/assignments/b2926256

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# todo1.done!

# puts todo1
# puts todo2
# puts todo3



# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title
  attr_reader :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError.new "Can only add Todo objects" if todo.class != Todo
    @todos << todo
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all? { |item| item.done? }
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    @todos.each do |item|
      item.done!
    end
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def to_s
    puts "---- Today's Todos ----"
    @todos.each { |item| puts item.to_s }
  end

  def each
    # counter = 0

    # while counter < @todos.size
    #   yield(@todos[counter])
    #   counter += 1
    # end

    @todos.each do |todo|
      yield(todo)
    end

    self
  end

  def select
    list = TodoList.new(title)

    each do |todo|
      list.add(todo) if yield(todo)
    end

    list
  end

  def find_by_title(title)
    @todos.select { |todo| todo.title === title }.first
  end

  def all_done
    list = TodoList.new(title)

    @todos.select { |todo| list.add(todo) if todo.done? }
    
    list
  end

  def all_not_done
    list = TodoList.new(title)

    @todos.select { |todo| list.add(todo) if !todo.done? }
    
    list
  end

  def mark_done(title)
    result = @todos.select { |todo| todo.title == title }
    result.each { |todo| todo.done! }
  end

  def mark_all_done
    @todos.each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    @todos.each do |todo|
      todo.undone!
    end
  end
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
list.size                       # returns 3

# first
list.first                      # returns todo1, which is the first item in the list

# last
list.last                       # returns todo3, which is the last item in the list

#to_a
list.to_a                      # returns an array of all items in the list

#done?
list.done?                     # returns true if all todos in the list are done, otherwise false


# ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError


# ---- Marking items in the list -----

# mark_done_at
# list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# done!
# list.done!                      # marks all items as done


# ---- Deleting from the list -----

# shift
# list.shift                      # removes and returns the first item in list

# pop
# list.pop                        # removes and returns the last item in list

# remove_at
# list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError


# ---- Outputting the list -----

# to_s
# list.to_s                      # returns string representation of the list

# list.each do |todo|
#   puts todo
# end

# p list.object_id

# todo1.done!
# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.inspect

# p list.find_by_title('Buy milk1')

todo1.done!
# p list.all_done
# p list.all_not_done
list.mark_all_done
list.mark_all_undone
list.mark_done('Buy milk')
p list