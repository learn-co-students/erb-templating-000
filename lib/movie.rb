class Movie

  @@all = []

  def self.all
    @@all
  end

  def self.reset_movies!
    @@all.clear
  end	
  
  def self.make_movies!
    res = File.read("./spec/fixtures/movies.txt").split("\n")
    res.each do |e| 
      attrs = e.split(" - ")
      mov = Movie.new(attrs[0], attrs[1].to_i, attrs[2], attrs[3])
    end
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
    cap_title = title.split.map { |e| e.capitalize }.join
    "#{Inflecto.underscore(cap_title)}.html"
  end

  def get_binding
    binding
  end  
end