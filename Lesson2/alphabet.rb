alpha = ('a'..'z').to_a
vowels = ['a', 'e', 'i', 'o', 'u']
res = {}

alpha.each do |char|
    if vowels.include?(char)
        res[char] = alpha.index(char) + 1
    end
end
puts res




