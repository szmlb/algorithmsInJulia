#
# Insert Sort
#

function sortValues(A)

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

# list to be sorted
A = [15,  9,  8,  1,  4,  11,  7,  12,  13,  6,  5,  3,  16,  2,  10,  14]

# sorting
@time sortValues(A)
print(A)
