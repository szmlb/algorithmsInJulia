#
# Heap Sort
#

function heapSort(A)

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

function main()

  # list to be sorted
  rng = MersenneTwister(1234);
  A = shuffle(rng, Vector(1:100))
  Aorigin = copy(A)

  # sorting
  @time heapSort(A)

  print("The original list: ")
  println(Aorigin)

  print("The sorted list: ")
  println(A)

end



if contains(@__FILE__, PROGRAM_FILE)
    main()
end
