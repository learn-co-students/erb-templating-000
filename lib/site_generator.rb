class SiteGenerator

  attr_reader :unordered_list

  ##i'll need a url cleansing method here probably

  def make_ul
    @unordered_list_make = ""
    @unordered_list_generate = ""
    Movie.all.each{|movie| 
      @unordered_list_make << "<li><a href=\"movies/#{movie.url}\">#{movie.title}</a></li>"
      @unordered_list_generate << "<li><a href=\"#{movie.url}\">#{movie.title}</a></li>"
    }
  end

  def make_index!
    make_ul
    File.write("_site/index.html","<!DOCTYPE html><html><head><title>Movies</title></head><body><ul>#{@unordered_list_make}</ul></body></html>")
  end

  def generate_pages!
    #Dir.mkdir("_site/movies") that only needed to happen once, or else be deleted by the spec
    make_ul
    template = File.read("lib/templates/movie.html.erb")
    instance = ERB.new(template)
    Movie.all.each{|movie|
      File.open("_site/movies/#{movie.url}", "w+") {|f| 
        f.write(instance.result(binding))
      }
    }
    
  end
end