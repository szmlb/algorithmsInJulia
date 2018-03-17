#
# Bucket Sort
#

function bucketSort(A, min_bucket, max_bucket)
    buckets = []
    for i in min_bucket:max_bucket
        push!(buckets, nothing)
    end

    for i in A
        buckets[A[i]] = A[i]
    end

    x = 1
    for i in min_bucket:max_bucket
        if buckets[i] != nothing
            A[x] = buckets[i]
            x = x + 1
        end
    end
end

function main()

  # list to be sorted
  rng = MersenneTwister(1234);
  A = shuffle(rng, Vector(1:100))
  Aorigin = copy(A)

  # sorting
  n = length(A)
  @time bucketSort(A, 1, n)

  print("The original list: ")
  println(Aorigin)

  print("The sorted list: ")
  println(A)

end

if contains(@__FILE__, PROGRAM_FILE)
    main()
end
