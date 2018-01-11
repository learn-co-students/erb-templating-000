require 'erb'
class SiteGenerator
  def make_index!
    fixtures_html = ""
    File.open("./spec/fixtures/index.html").each do |line|
      fixtures_html += "#{line}"
    end
    File.open("./_site/index.html", "w") { |file| file.write(fixtures_html) }
  end

  def generate_pages!
    template = ERB.new(File.read("./lib/templates/movie.html.erb")) #create one instance of ERB template
    Movie.all.each do |movie| #iterate through movie array
      @title = movie.title
      @release_date = movie.release_date
      @director = movie.director
      @summary = movie.summary
      @url = movie.url
      rendered_html = template.result(binding) #store result in a variable
      File.open("./_site/movies/#{@url}", "w") { |file| file.write(rendered_html) } #write each result to file in "template" format
    end
  end
end #class end
