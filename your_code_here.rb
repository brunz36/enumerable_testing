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

    @collection.each do |book|
      yield(book, index)
      index += 1
    end

  end
  # The rest of the code for all the enumerables
  # you must write go here
end
