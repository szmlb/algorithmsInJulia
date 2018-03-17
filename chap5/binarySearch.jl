function binarySearch(A, t)

  low = 1
  high = length(A)
  while low <= high
    mid = Int(round((low + high) / 2))
    if t == A[mid]
      return mid
    elseif t < A[mid]
      high = mid - 1
    elseif t > A[mid]
      low = mid + 1
    end
  end
  return false

end

function main()

  # list to be sorted
  rng = MersenneTwister(1234);
  list_size = 1e7
  A = Vector(1:list_size) # The list is to be sorted for binary search

  # Search
  search_num = 3000
  index_found = @time binarySearch(A, search_num)

  print("Search for : ")
  println(search_num)

  print("Found index: ")
  println(index_found)

  print("Found value is ... ")
  println(A[index_found])

end

if contains(@__FILE__, PROGRAM_FILE)
    main()
end
