require 'awesome_print'

class ReimplementEnumerable
  def initialize(collection)
    @collection = collection
  end

  def select
    result = []

    @collection.each do |element|
      should_select = yield(element)
      if should_select
        result << element
      end
    end

    result
  end

  def count
    result = []

    @collection.each do |element|
      if yield(element)
        result << element
      end
    end

    result.count
  end

  def all?

    @collection.each do |element|
      unless yield(element)
        return false
      end
    end

    true
  end

  def find

    @collection.each do |element|
      if yield(element)
        return element
      end
    end

    nil
  end

  def each_with_index
    index = 0

    @collection.each do |element|
      yield(element, index)
      index += 1
    end

  end

  def drop(arg)
    counter = 0
    array = []

    @collection.each do |element|
      if counter >= arg
        array << element
      end
      counter += 1
    end
    array

  end

  def drop_while
    each_with_index do |element, index|
      unless yield(element)
        return @collection[index..-1]
      end
    end

    return []
  end

  def find_index
    results = 0

    @collection.each do |element|
      if yield(element)
        return results
      end
      results += 1
    end
  end

  def include?(element_in)

    @collection.each do |element|
      if element == element_in
        return true
      end
    end
    false

  end

  def map
    results = []

    @collection.each do |element|
      should_map = yield(element)
      if should_map
        results << should_map
      end
    end

    results
  end

  def max_by
    results = []
    max_variable = 0

    @collection.each do |element|
      should_max = yield(element)
      if should_max > max_variable
        max_variable = should_max
        results.pop
        results << element
      end
    end

    results[0]
  end

  def min_by
    results = []
    min_array = []

    @collection.each do |element|
      min_array << yield(element)
      if min_array[0] > min_array[-1]
        min_array.pop
        results.pop
        results << element
      end
    end

    results[0]
  end

  def reject
    true_variables = []

    @collection.each do |element|
      variable = yield(element)
      unless variable
        true_variables << element
      end
    end
    true_variables
  end

  def reverse_each
    results = []

    @collection.each do |element|
      results.insert(0, element)
    end

    results
  end

  def partition
    true_array = []
    false_array = []

    @collection.each do |element|
      if yield(element)
        true_array << element
      else
        false_array << element
      end
    end

    return [true_array, false_array]
  end

  def one?

    @collection.each do |element|
      if yield(element)
        return true
      end
    end
  end

  def none?

    @collection.each do |element|
      if yield(element)
        return false
      end
    end
    true
  end

end
