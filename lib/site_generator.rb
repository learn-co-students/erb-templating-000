

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

# "<!DOCTYPE html><html><head><title>Movies</title></head><body><ul><li><a href=\"movies/the_matrix.html\">The Matrix</a></li><li><a href=\"movies/the_lego_movie.html\">The Lego Movie</a></li><li><a href=\"movies/robocop.html\">RoboCop</a></li><li><a href=\"movies/the_wolf_of_wall_street.html\">The Wolf of Wall Street</a></li><li><a href=\"movies/frozen.html\">Frozen</a></li><li><a href=\"movies/logan's_run.html\">Logan's Run</a></li><li><a href=\"movies/a_fish_called_wanda.html\">A Fish Called Wanda</a></li><li><a href=\"movies/the_godfather.html\">The Godfather</a></li><li><a href=\"movies/apocalypse_now.html\">Apocalypse Now</a></li><li><a href=\"movies/the_sting.html\">The Sting</a></li><li><a href=\"movies/temple_grandin.html\">Temple Grandin</a></li><li><a href=\"movies/gravity.html\">Gravity</a></li><li><a href=\"movies/empire_of_the_sun.html\">Empire of the Sun</a></li><li><a href=\"movies/the_big_lebowski.html\">The Big Lebowski</a></li><li><a href=\"movies/pan's_labyrinth.html\">Pan's Labyrinth</a></li><li><a href=\"movies/unbreakable.html\">Unbreakable</a></li><li><a href=\"movies/gattaca.html\">Gattaca</a></li><li><a href=\"movies/the_dark_knight.html\">The Dark Knight</a></li><li><a href=\"movies/donnie_darko.html\">Donnie Darko</a></li><li><a href=\"movies/rescue_dawn.html\">Rescue Dawn</a></li><li><a href=\"movies/the_prestige.html\">The Prestige</a></li><li><a href=\"movies/memento.html\">Memento</a></li><li><a href=\"movies/avatar.html\">Avatar</a></li><li><a href=\"movies/killing_them_softly.html\">Killing Them Softly</a></li><li><a href=\"movies/300.html\">300</a></li></ul></body></html>"