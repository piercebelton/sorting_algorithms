def time_method(method, arg)
  start_time = Time.now
  self.send(method, arg)
  end_time = Time.now
  puts "This took #{(end_time - start_time)*1000} milliseconds"
end

def generate_array(size)
  arr = []
  size.times { arr.push(rand(size))}
  arr
end

def bubble_sort(arr)
  return arr if arr.size <= 1

  loop do
    swapped = false
    (arr.size - 1).times do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end
    break if !swapped
  end
  arr
end

def merge_sort(array)
  def merge(left_sorted, right_sorted)
    res = []
    l = 0
    r = 0

    loop do
      break if r >= right_sorted.length and l >= left_sorted.length

      if r >= right_sorted.length or (l < left_sorted.length and left_sorted[l] < right_sorted[r])
        res << left_sorted[l]
        l += 1
      else
        res << right_sorted[r]
        r += 1
      end
    end

    return res
  end

  def mergesort_iter(array_sliced)
    return array_sliced if array_sliced.length <= 1

    mid = array_sliced.length/2 - 1
    left_sorted = mergesort_iter(array_sliced[0..mid])
    right_sorted = mergesort_iter(array_sliced[mid+1..-1])
    return merge(left_sorted, right_sorted)
  end

  mergesort_iter(array)
end

arr = generate_array(10000)
arr2 = generate_array(10000)

time_method(:bubble_sort, arr)
time_method(:merge_sort, arr2)
