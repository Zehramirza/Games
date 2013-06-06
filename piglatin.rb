
start_of_second_part = 0

def word
	puts "please enter some word"
	word = gets.chomp
end

vowel = ["a", "e", "i", "o", "u"]
alpha = ("a".."z").to_a
cons = alpha - vowel

word_array = word.split("") 

word_array.each_with_index do |letter, index|
	if vowel.include?(letter)
		puts letter
			start_of_second_part = index
		puts "The index that was stopped at was: " + index.to_s

		break
	end
	puts letter
end
 
puts start_of_second_part
second_part = word_array[start_of_second_part, word_array.length]
new_word = word_array[0, start_of_second_part]

puts second_part.length
puts second_part.join
puts second_part.to_s + new_word.to_s + "ay"