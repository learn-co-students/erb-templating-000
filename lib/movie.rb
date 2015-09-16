class Movie

  @@all = []

  def self.all
    @@all
  end

  def self.reset_movies!
    @@all.clear
  end	
  
  def self.make_movies!
    res = File.read("./spec/fixtures/movie.txt")
  end
  
  def self.recent
    @@all.select { |e| e.release_date >= 2012 }
  end
  
  attr_accessor :title, :release_date, :director, :summary
  
  def initialize(title, release_date, director, summary)
    @title = title
	@release_date = release_date
	@director = director
	@summary = summary
	
	@@all << self unless @@all.include?(self)
  end
  
  def url
    "#{Inflecto.underscore(title.gsub(/\s+/,""))}.html"
  end
end