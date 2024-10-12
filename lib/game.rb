puts "Game started!"


fname = 'google-10000-english.txt'
words = []

File.readlines(fname).each do |line|
  words << line.chomp if line.size > 5 && line.size <= 12
end

selected_word = words.sample
p words
p words.size
p selected_word