#
# Insert Sort
#

function insertSort(A)

  for pos in 2:length(A)
    insert(A, pos, A[pos])
  end

end

function insert(A, pos, value)

  i = pos - 1
  while i >= 1 && A[i] > value
    A[i+1] = A[i]
    i = i - 1
  end
  A[i+1] = value

end

function main()

  # list to be sorted
  rng = MersenneTwister(1234);
  A = shuffle(rng, Vector(1:100))
  Aorigin = copy(A)

  # sorting
  @time insertSort(A)

  print("The original list: ")
  println(Aorigin)

  print("The sorted list: ")
  println(A)

end

if contains(@__FILE__, PROGRAM_FILE)
    main()
end
