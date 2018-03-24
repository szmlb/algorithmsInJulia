function hash_store(A, hash_key)

    H = zeros(hash_key+1)
    for x in A
        k = Int(x % hash_key)
        while H[k+1] != 0
          k = (k + 1) % hash_key
        end
        H[k+1] = x
    end

    return H

end

function hash_search(ls, x, hash_key)

    k = Int(x % hash_key)
    while ls[k+1] != 0
        if ls[k+1] == x
            return k + 1
        else
            k = (k + 1) % hash_key
        end
    end

    return nothing

end

function hashSearch(A, hash_key, t)

    hash_array = hash_store(A, hash_key)
    hash_index = hash_search(hash_array, t, hash_key)

    return hash_array, hash_index

end

function main()

  # list to be sorted
  rng = MersenneTwister(1234);
  list_size = 10
  A = shuffle(rng, Vector(1:list_size))

  # Search
  search_num = 10
  hash_array, index_found = @time hashSearch(A, 11, search_num)

  print("Search for : ")
  println(search_num)

  print("Found index: ")
  print(index_found)
  println(" (in hash array)")

  print("Found value is ... ")
  println(hash_array[index_found])

end

if contains(@__FILE__, PROGRAM_FILE)
    main()
end
