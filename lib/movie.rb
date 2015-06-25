
require 'Pry'

class Movie

  attr_reader :title, :release_date, :director, :summary

def initialize(title, release_date, director, summary)
  @title = title
  @release_date = release_date
  @director = director
  @summary = summary
  MOVIES << self
end

MOVIES = []

def url
  self.title.to_s.gsub(" ","_").downcase + ".html"
end

def self.all
  MOVIES
end

def self.reset_movies!
  until MOVIES.empty?
    MOVIES.pop
  end
end

def self.make_movies!
  File.open('spec/fixtures/movies.txt').each do |line|
    array = line.split(" - ")
    Movie.new(array[0],array[1].to_i,array[2],array[3])
  end
end

def self.recent
  array = []
  MOVIES.each {|movie| if movie.release_date>=2012 then array << movie end}
  array
end

end