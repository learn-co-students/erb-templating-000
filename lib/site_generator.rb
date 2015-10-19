class SiteGenerator
  
  def movies_list
  	str = "<ul>"
    Movie.all.each do |movie|
      str << "<li>"
      str << "<a href=\"movies/#{movie.url}\">"
      str << movie.title
      str << "</a>"
      str << "</li>"
    end
    str << "</ul>"
  end
  	
  def make_index!
    html = "<!DOCTYPE html>"
    html << "<html>"
    html << "<head>"
    html << "<title>Movies</title>"
    html << "</head>"
    html << "<body>"
    html << movies_list
    html << "</body>"
    html << "</html>"
    File.write("./_site/index.html", html)
  end

  def generate_pages!
    Dir.mkdir("./_site/movies") unless Dir.exist?("./_site/movies")
    template = ERB.new(File.read("./lib/templates/movie.html.erb"))
    Movie.all.each do |movie|
      File.write("./_site/movies/#{movie.url}", template.result(movie.get_binding))
    end  
  end
end