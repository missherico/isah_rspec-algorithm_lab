class SortedArray
  attr_reader :internal_arr

  def initialize arr=[]
    @internal_arr = []
    arr.each { |el| add el }
  end

  def add el
    # we are going to keep this array
    # sorted at all times. so this is ez
    lo = 0
    hi = @internal_arr.size
    # note that when the array just
    # starts out, it's zero size, so
    # we don't do anything in the while
    # otherwise this loop determines
    # the position in the array, *before*
    # which to insert our element
    while lo < hi
      # let's get the midpoint
      mid = (lo + hi) / 2
      if @internal_arr[mid] < el
        # if the middle element is less 
        # than the current element
        # let's increment the lo by one
        # from the current midway point
        lo = mid + 1
      else
        # otherwise the hi *is* the midway 
        # point, we'll take the left side next
        hi = mid 
      end
    end

    # insert at the lo position
    @internal_arr.insert(lo, el)
  end

  def each &block  
    #let's keep track of our index
    i = 0
    until i == @internal_arr.length
      yield @internal_arr[i]
      i += 1
    end
    @internal_arr
  end

  def map &block
    index = 0
    new_arr = []
    each do |el|
      new_arr[index] = yield el
      index +=1
    end

    # until index == new_arr.length
    #   yield new_arr[index]
    #   index += 1
    # end
    new_arr
    #raise NotImplementedError.new("You need to implement the map method!")
  end

  def map! &block
    index = 0
    @internal_arr.each do |el|
      @internal_arr[index] = yield el
      index += 1
    end
    @internal_arr
    #raise NotImplementedError.new("You need to implement the map! method!")
  end

  def find &block
    @internal_arr.each do |el|
      return el if yield el
    end
      nil
    # return el
    #raise NotImplementedError.new("You need to implement the find method!")
  end

  def inject (acc=nil, &block)
     @internal_arr.each do |el|
      acc = yield acc, el
    end
    acc

    raise NotImplementedError.new("You need to implement the inject method!")
  end
end
