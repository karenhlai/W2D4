def my_min1(array)
  min = array.first

  array.each do |el|
    array.each do |el2|
      if el < el2 && min > el 
        min = el 
      end
    end
  end
  min
end


#linear
def my_min(array)
  min = array.first
  array.length.times do |i|
    if array[i] < min 
      min = array[i]
    end
  end
  min
end

# n^3 - slicing with range
def largest_contiguous_sub_sum(list)
  subsets = []
  #quadratic(nested loop)
  list.each_with_index do |el, i|
    list.each_with_index do |el2, j|
      sub = list[i..j]
      subsets << sub if j >= i 
    end
  end
  #exponential(subsets)
  subsets.each_with_index do |subarr, i|
    subsets[i] = subarr.inject(:+)
  end
  subsets.max
end

# o(n)
def other_sub_sum(list)
  current_sum = list.first
  max_sum = list.first

  list.each do |n|
    current_sum += n 
    max_sum = current_sum if current_sum > max_sum 
    current_sum = 0 if current_sum < 0
  end
  max_sum
end