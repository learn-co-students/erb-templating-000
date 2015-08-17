class SiteGenerator
	def make_index!
		File.open('./_site/index.html', 'w') do |f|
			f.write("<!DOCTYPE html><html><head><title>Movies</title></head><body><ul>")
			Movie.all.each do |movie|
				f.write("<li><a href=\"movies/#{movie.url}\">#{movie.title}</a></li>")
			end
			f.write('</ul></body></html>')
			f.close
		end
	end

	def generate_pages!
		Movie.all.each do |movie|
		  template = ERB.new File.read("lib/templates/movie.html.erb")
		  File.new("_site/movies/#{movie.url}", "w")
		  File.open("_site/movies/#{movie.url}", 'w') do |f|
		  	f.write("#{template.result(movie.get_binding)}")
		  	f.close
		  end
		end
	end

end