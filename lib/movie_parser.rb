require 'open-uri'
require 'nokogiri'

module MovieParser
  URL_WIKI_IMDB250 = "https://ru.wikipedia.org/wiki/250_лучших_фильмов_по_версии_IMDb"

  extend self

  def from_wiki_imdb250
    doc = Nokogiri::HTML.parse(open_request(URL_WIKI_IMDB250))

    tags = doc.xpath("//tr")

    movies = tags.map do |tr|
      Movie.new(
        name: tr.text.split("\n")[2],
        year: tr.text.split("\n")[3],
        producer: tr.text.split("\n")[4]
      )
    end

    movies.shift(2)

    MovieCollection.new(movies)
  end

  private

  def open_request(url)
    URI.open(URI.escape(url))
  end
end
