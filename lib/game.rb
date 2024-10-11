puts "Game started!"

lines = File.readlines('google-10000-english.txt')
lines.each do |line|
  puts line if line.length > 5 && line.length < 12
end