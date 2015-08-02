

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
    File.open('_site/index.html', 'w+') do |filey|
      filey.write(@index)
      filey.close
    end
  end

  def generate_pages!
    Movie::SELF_NUMBER.each do |movie|
      @title = movie.title
      @release_date = movie.release_date
      @director = movie.director
      @summary = movie.summary
      File.open('_site/movies/' + movie.url, 'w+') do |filey|
        template = File.open('lib/templates/movie.html.erb', 'r') do |filey2|
          template2 = File.read(filey2)
          template3 = ERB.new template2 
          filey.write(template3.result(binding))
        end
      end
    end
  end

end