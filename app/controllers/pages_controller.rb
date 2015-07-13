class PagesController < ApplicationController
  def about
  end

  def contact
  end

  def home
  	@schools = School.all
		@hash = Gmaps4rails.build_markers(@schools) do |school, marker|
		  marker.lat school.latitude
		  marker.lng school.longitude
		  marker.infowindow "<strong>#{school.name}</strong> <br> #{school.address} <br> Phone: #{school.phone} 
		  <br> #{school.description} <br> "

		end
  end
end
