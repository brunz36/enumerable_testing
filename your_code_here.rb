class ReimplementEnumerable
  def initialize(collection)
    @collection = collection
  end

  def select
    result = []

    @collection.each do |book|
      should_select = yield(book)
      if should_select
        result << book
      end
    end

    result
  end

  def count
    result = []

    @collection.each do |book|
      if yield(book)
        result << book
      end
    end

    result.count
  end

  def all?

    @collection.each do |book|
      unless yield(book)
        return false
      end
    end

    true
  end

  def find

    @collection.each do |book|
      if yield(book)
        return book
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

  def drop(arg)
    counter = 0
    array = []

    @collection.each do |book|
      if counter >= arg
        array << book
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

    @collection.each do |book|
      if yield(book)
        return results
      end
      results += 1
    end
  end
  # The rest of the code for all the enumerables
  # you must write go here
end
