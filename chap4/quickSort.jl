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

function sortValues(A)

  n = length(A)
  quickSort(A, 1, n)

end

function main()

  # list to be sorted
  A = [15,  9,  8,  1,  4,  11,  7,  12,  13,  6,  5,  3,  16,  2,  10,  14]

  # sorting
  @time sortValues(A)
  print(A)

end

if contains(@__FILE__, PROGRAM_FILE)
    main()
end
