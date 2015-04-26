class GenresController < ApplicationController

	def index
		@genres = Genres.all 
	end

	def show
		@genre = Genre.find_by!(slug: params[:id])
	end
end
