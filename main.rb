require_relative 'lib/movie'
require_relative 'lib/movie_collection'
require_relative 'lib/movie_parser'

movie_collection = MovieParser.from_wiki_imdb250

puts 'Программа «Фильм на вечер»'
puts

movie_collection.uniq_producers.each.with_index(1) do |producer, index|
  puts "#{index}: #{producer} "
end

puts "Фильм какого режиссера вы хотите сегодня посмотреть?"
choise = gets.to_i - 1

puts "И сегодня вечером рекомендую посмотреть:"
puts movie_collection.recommended_movie(choise)

go = gets.chomp