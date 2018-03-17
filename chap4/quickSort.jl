function selectPivotIndex(A, left, right)
#=
This function returns an index of pivot.
=#

  # The most simplest way to choose a pivot index: A[1] or A[end]
  pivot_index = left   # A[1]
  #pivot_index = right # A[end]

  return pivot_index

end

function partitionList(A, left, right, pivot_index)
#=
This function reearranges the input list A as follows:
A' = [ (elements smaller than pivot) ,  pivot, ... elements larger than pivot]
In the end, an index of the pivot is returned.
=#

  pivot = A[pivot_index]

  # Move the pivot to the end of the list
  tmp = A[right]
  A[right] = A[pivot_index]
  A[pivot_index] = tmp

  # Move elements which are smaller than the pivot
  store = left
  for idx in left:right-1
    if A[idx] <= pivot

      tmp = A[idx]
      A[idx] = A[store]
      A[store] = tmp

      store = store + 1
    end
  end

  tmp = A[right]
  A[right] = A[store]
  A[store] = tmp

  return store

end

function quickSort(A, left, right)
#=
Quick sort function
=#

  if right <= left
    return
  end

  pivot_index = selectPivotIndex(A,  left,  right)
  pivot_index = partitionList(A, left, right, pivot_index)

  quickSort(A, left,  pivot_index-1)
  quickSort(A, pivot_index+1,  right)

end

function main()

  # list to be sorted
  rng = MersenneTwister(1234);
  A = shuffle(rng, Vector(1:100))
  Aorigin = copy(A)

  # sorting
  n = length(A)
  @time quickSort(A, 1, n)

  print("The original list: ")
  println(Aorigin)

  print("The sorted list: ")
  println(A)

end

if contains(@__FILE__, PROGRAM_FILE)
    main()
end
