require "pry"

class Movie

  attr_accessor :title, :release_date, :director, :summary, :url

  SELF_NUMBER = []

  def initialize(title, release_date, director, summary)
    @title = title
    @release_date = release_date
    @director = director
    @summary = summary
    @url = (title.downcase.sub(" ", "_")) + ".html"

    SELF_NUMBER.push(self)
  end

  def self.all
    SELF_NUMBER
  end

  def self.reset_movies!
    SELF_NUMBER.clear
  end

  def url
    @url
  end


  def self.make_movies!
    File.open('spec/fixtures/movies.txt', 'r') do |filey|
      thisss = File.read(filey)
      s2 = thisss.split("\n")
      s2.each do |movie|
        man2 = movie.split(" - ")
        Movie.new(man2[0], man2[1].to_i, man2[2], man2[3])
      end
    end
  end

  def self.recent
    here2 = []
    SELF_NUMBER.map do |movie| 
      if (movie.release_date.to_i >= 2012)
        here2.push(movie)
      else
        movie
      end
    end
    return here2
  end

end