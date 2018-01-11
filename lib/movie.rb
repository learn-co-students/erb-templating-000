
class Movie
  attr_accessor :title, :release_date, :director, :summary

  @@movies = []

  def initialize(title, release_date, director, summary)
    @title = title
    @release_date = release_date
    @director = director
    @summary = summary
    @@movies << self
  end

  def self.all
    @@movies
  end

  def self.reset_movies!
    @@movies.clear
  end

  def url
    url = self.title.downcase.gsub(" ","_") + ".html"
    url.gsub!(/[!@%&"']/,'')
    return url
  end

  def self.make_movies!
    File.open("./spec/fixtures/movies.txt").each do |line|
      arr = line.split(" - ")
      title = arr[0]
      release_date = arr[1].to_i
      director = arr[2]
      summary = arr[3]

      movie = Movie.new(title, release_date, director, summary)
    end
  end

  def self.recent
    recent_movies = []
    @@movies.each do |m|
        if m.release_date >= 2012
        recent_movies << m
        end
      end
    return recent_movies
  end #def recent end

end #class end
