
def fibo(max_val)
    fibo = [0, 1]

    loop do
        val = fibo[-1] + fibo[-2]
        break if val >= max_val
        fibo << val
    end
    fibo
end
print fibo(100)

  # arr = [1, 1]

  # while arr.length < 10
  #     last_elem = arr[-1]
  #     second_to_last = arr[-2]
  #     next_elem = last_elem + second_to_last
  #     arr << next_elem 
  # end

  # puts arr
  
    


