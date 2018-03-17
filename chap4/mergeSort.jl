#
# Merge Sort
#

function sortValues(A)

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

# list to be sorted
A = [15,  9,  8,  1,  4,  11,  7,  12,  13,  6,  5,  3,  16,  2,  10,  14]

# sorting
@time sortValues(A)
print(A)
