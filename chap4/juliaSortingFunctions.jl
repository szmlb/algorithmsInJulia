function main()

  # list to be sorted
  rng = MersenneTwister(1234);
  A = shuffle(rng, Vector(1:100))
  Aorigin = copy(A)

  # sorting
  @time Aqs = sort(A; alg=QuickSort)
  @time Ais = sort(A; alg=InsertionSort)
  @time Ams = sort(A; alg=MergeSort)
  @time Apqs = sort(A; alg=PartialQuickSort(5))

  print("The original list: ")
  println(Aorigin)

  print("The sorted list: ")
  println(Aqs)

end

if contains(@__FILE__, PROGRAM_FILE)
    main()
end
