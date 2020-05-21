
arr = [1, 1]

    while arr.length <= 10
        last_elem = arr[-1]
        second_to_last = arr[-2]
        next_elem = last_elem + second_to_last
        arr << next_elem
    end
    
print arr

