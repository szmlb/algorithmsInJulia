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

function sortValues(A)

  n = length(A)
  bucketSort(A, 1, n)

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
