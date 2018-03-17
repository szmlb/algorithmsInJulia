#
# Selection Sort
#

function selectionSort(A)
#=
Choose max value of A[1:i]
Insert it to the correct position
=#
  i = length(A)
  while i > 0
    max_pos = selectMax(A, 1,  i)
    if max_pos != i
      tmp = A[i]
      A[i] = A[max_pos]
      A[max_pos] = tmp
    end
    i = i - 1
  end

end

function selectMax(A, left, right)
#=
Select a max value index of A[left:right]
=#

  max_pos = left
  i = left
  while i <= right
    if A[i] > A[max_pos]
      max_pos = i
    end
    i = i + 1
  end

   return max_pos

end

function main()

  # list to be sorted
  rng = MersenneTwister(1234);
  A = shuffle(rng, Vector(1:100))
  Aorigin = copy(A)

  # sorting
  @time selectionSort(A)

  print("The original list: ")
  println(Aorigin)

  print("The sorted list: ")
  println(A)

end

if contains(@__FILE__, PROGRAM_FILE)
    main()
end
