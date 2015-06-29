require 'erb'
class SiteGenerator

  def initialize
  end

  def make_index!
    File.new('_site/index.html')
    File.open('_site/index.html', 'w') do |f|
      f.write('<!DOCTYPE html>')
      f.write('<html>')
      f.write('<head>')
      f.write('<title>Movies</title>')
      f.write('</head>')
      f.write('<body>')
      f.write('<ul>')
      Movie.all.each {|movie| 
        f.write('<li><a href="movies/')
        f.write(movie.url)
        f.write('">')
        f.write(movie.title)
        f.write('</a></li>') }
      f.write('</ul>')
      f.write('</body>')
      f.write('</html>')
    end

  end

  def generate_pages!
    Movie.all.each {|movie|
      name = '_site/movies/' + movie.url
      filename = File.new(name, "w")
      template = File.read('lib/templates/movie.html.erb')
      renderer = ERB.new(template)
      filename.write(renderer.result(binding))
      filename.close
    }

  end


end