class MovieCollection
  attr_reader :movies, :uniq_producers

  def initialize(movies)
    @movies = movies
    @uniq_producers = @movies.map(&:producer).uniq
  end

  def recommended_movie(choise)
    @movies.select { |item| item.producer == @uniq_producers[choise] }.sample
  end
end
