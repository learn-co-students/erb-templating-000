

class SiteGenerator

  attr_accessor :index

  def initialize
    @index = "<!DOCTYPE html><html><head><title>Movies</title></head><body><ul>"
  end

  def make_index!
    Movie::SELF_NUMBER.each do |movie|
      @index += "<li><a href=\"movies/" + movie.url + "\">" + movie.title + "</a></li>" 
    end
    @index += "</ul></body></html>"
    File.open('_site/index.html', 'a+') do |filey|
      filey.write(@index)
      filey.close
    end
  end

  def generate_pages!
  template = ERB.new(File.open('lib/templates/movie.html.erb').read)
  movies = Movie.all
    movies.each do |movie|
    File.open("_site/movies/#{movie.url}", "w+") do |f|
      f << template.result(binding)
      f.close
      end
    end
  end

end