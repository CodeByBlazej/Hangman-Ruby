puts "Game started!"

chosen_word = nil
path = ''
f = File.open("google-10000-english.txt")

while line = f.gets do
  puts line if line.length > 5 && line.length <= 12
end

f.close