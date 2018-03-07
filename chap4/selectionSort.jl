#
# Selection Sort
#

function sortValues(A)
#=
Choose max value of A[0:i]
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

# list to be sorted
A = [15,  9,  8,  1,  4,  11,  7,  12,  13,  6,  5,  3,  16,  2,  10,  14]

# sorting
@time sortValues(A)
print(A)
