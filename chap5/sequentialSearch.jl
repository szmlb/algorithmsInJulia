function sequentialSearch(A, t)

  for (index, value) in enumerate(A)
    if value == t
      return index
    end
  end
  return false

end

function main()

  # list to be sorted
  rng = MersenneTwister(1234);
  list_size = 1e7
  A = shuffle(rng, Vector(1:list_size))

  # Search
  search_num = list_size/2
  index_found = @time sequentialSearch(A, search_num)

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
