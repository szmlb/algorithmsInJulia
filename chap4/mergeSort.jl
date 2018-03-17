#
# Merge Sort
#

function mergeSort(A)

  Anew = copy(A)
  mergesort_array(Anew,  A,  1,  length(A)+1)

end

function mergesort_array(A, result, left, right)

  if right - left < 2
    return
  end
  if right - left == 2
    if result[left] > result[left+1]
      result[left],  result[left+1] = result[left+1], result[left]
    end
    return
  end

  mid = Int(round((right + left) / 2))
  mergesort_array(result, A, left,  mid)
  mergesort_array(result, A, mid, right)

  i = left
  j = mid
  idx = left
  while idx < right
    if j >= right || (i < mid && A[i] < A[j])
      result[idx] = A[i]
      i = i + 1
    else
      result[idx] = A[j]
      j = j + 1
    end
    idx = idx + 1
  end

end

function main()

  # list to be sorted
  rng = MersenneTwister(1234);
  A = shuffle(rng, Vector(1:100))
  Aorigin = copy(A)

  # sorting
  @time mergeSort(A)

  print("The original list: ")
  println(Aorigin)

  print("The sorted list: ")
  println(A)

end

if contains(@__FILE__, PROGRAM_FILE)
    main()
end
