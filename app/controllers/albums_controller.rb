class AlbumsController < ApplicationController

	def show
		@album = Album.find(params[:id])
	end


	def new
		@album = current_user.albums.new
	end

	def create
		@album = current_user.albums.create(album_params)

		respond_to do |format|
			if @album.save 
    			format.html { redirect_to @album, notice: 'Album successfully created!' }
				format.json { render :show, status: :created, location: @album }
			else
				format.html { render :new }
				format.json { render json: @album.errors, status: :unprocessable_entity}\
			end
		end

	end

	private
		def album_params
			params.require(:album).permit(:title, :user_id)
		end
end