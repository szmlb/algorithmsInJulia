#
# Heap Sort
#

function sortValues(A)

  buildHeap(A)

  n = length(A)
  i = n
  while i > 0

    tmp = A[1]
    A[1] = A[i]
    A[i] = tmp

    heapify(A, 1, i)

    i = i - 1
  end

end

function buildHeap(A)

  n = length(A)
  i = Int(n/2)
  while i > 0

    heapify(A, i, n)

    i = i - 1
  end

end

function heapify(A, idx, idx_max)
  largest = idx
  left = 2 * (idx-1) + 1
  right = 2 * (idx-1) + 2

  if left < idx_max && A[left] > A[idx]
    largest = left
  end
  if right < idx_max && A[right] > A[largest]
    largest = right
  end
  if largest != idx
    tmp = A[idx]
    A[idx] = A[largest]
    A[largest] = tmp
    heapify(A,  largest,  idx_max)
  end
end

# list to be sorted
A = [15,  9,  8,  1,  4,  11,  7,  12,  13,  6,  5,  3,  16,  2,  10,  14]

# sorting
@time sortValues(A)
print(A)
