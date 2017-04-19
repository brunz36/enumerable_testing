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

  # def drop_while
  #   results = []
  #   results_x = []
  #
  #   @collection.each do |book|
  #     while yield(book)
  #       results_x << book
  #       next
  #     end
  #     results << book
  #   end
  #
  #   results
  # end

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
      else
        return false
      end
    end

  end

  def map
    results = []

    @collection.each do |element|
      results << element.year
    end

    results
  end

  def max_by
    results = ""
    max_year = 0
    @collection.each do |element|
      if element.year > max_year
        max_year = element.year
        results = element
      end
    end

    results
  end

  # The rest of the code for all the enumerables
  # you must write go here
end
