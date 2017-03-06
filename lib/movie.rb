class Movie

  @@movies = []

  attr_accessor :title, :release_date, :director, :summary

  def initialize(title, release_date, director, summary)
    @title = title
    @release_date = release_date
    @director = director
    @summary = summary
    @@movies << self
  end

  def url
    "#{title.downcase.gsub(/"|'/,'').gsub(/\s/,'_')}.html"
  end

  def self.make_movies!
    movies = File.read("spec/fixtures/movies.txt")
    movies.split("\n").each{|movie|
      title, release_date, director, summary = movie.split(" - ")
      Movie.new(title, release_date.to_i, director, summary)
    }
  end

  def self.recent
    @@movies.select{|m| m.release_date >= 2012}
  end

  def self.reset_movies!
    @@movies.clear
  end

  def self.all
    @@movies
  end

end