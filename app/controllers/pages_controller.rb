class PagesController < ApplicationController
  def about
  end

  def contact
  end
  
  def search
  	if params[:search].present?
  		@schools = School.search(params[:search])
  	else
  		@schools = School.all
  	end
  end

  def home
  	@schools = School.all
		@hash = Gmaps4rails.build_markers(@schools) do |school, marker|
		  marker.lat school.latitude
		  marker.lng school.longitude
		  marker.infowindow "<strong>#{school.name}</strong> <br> #{school.address} <br> Phone: #{school.phone} 
		  <br> #{school.description} <br> #{view_context.link_to('Go to Page!', school_path(school.id))} "

		end
  end
end
