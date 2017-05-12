class SiteGenerator

    def make_index!
        open('_site/index.html', 'w') { |f|
            f << "<!DOCTYPE html>
                    <html>
                        <head>
                            <title>Movies</title>
                        </head>
                        <body>
                        <ul>"
            Movie.all.each do |movie|
                f << "<li><a href=\"movies/#{movie.url}\">#{movie.title}</a></li>"
            end
            f << "</ul></body></html>"           
        }
    end

  def generate_pages!
    template = ERB.new(File.open('lib/templates/movie.html.erb').read)
    movies = Movie.all
    movies.each do |movie|
        
      # @movie = movie
      File.open("_site/movies/#{movie.url}", "w+") do |f|
        f << template.result(binding)
        f.close
      end
    end
  end
    
end