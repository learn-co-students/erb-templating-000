class Movie
	attr_reader :title, :release_date, :director, :summary

	ALL_MOVIES = []

	def initialize(title, release_date, director, summary)
		ALL_MOVIES<<self
		@title = title
		@release_date = release_date
		@director = director
		@summary = summary
	end

	def url
		self.title.downcase.split.join('_') + ".html"
	end

	def self.all
		ALL_MOVIES
	end

	def self.reset_movies!
		self.all.clear
	end

	def self.make_movies!
		contents = File.read("./spec/fixtures/movies.txt")
		contents.split(/\n/).each do |movie|
			title = movie.split(' - ').first
			release_date = movie.split(' - ')[1].to_i
			director = movie.split(' - ')[2]
			summary = movie.split(' - ').last
			Movie.new(title, release_date, director, summary)
		end
	end

	def self.recent
		ALL_MOVIES.select do |movie|
			movie.release_date >= 2012
		end
	end

	def get_binding
		binding 
	end

end
