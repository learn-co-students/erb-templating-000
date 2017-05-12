class Movie
    attr_accessor :title, :release_date, :director, :summary

    @@all = []

    def initialize(title, release_date, director, summary)
        @title = title
        @release_date = release_date
        @director = director
        @summary = summary
        @@all << self
    end

    def url
        title_friendly = @title.downcase.tr(" ", "_").delete "'" 
        if @title == "The Wolf of Wall Street" 
            # binding.pry
        end
        "#{title_friendly}.html"
    end

    def self.all 
        @@all
    end

    def self.reset_movies!
        @@all.clear
    end

    def self.make_movies!
        movies = File.read("spec/fixtures/movies.txt").split("\n")
        movies.each do |movie|
            movie_details = movie.split(" - ")
            title = movie_details[0]
            date = movie_details[1].to_i
            director = movie_details[2]
            summary = movie_details[3]
            Movie.new(title, date, director, summary)
        end
    end

    def self.recent
        self.all.collect do |movie|
            movie if movie.release_date >= 2012
        end.compact
    end

end