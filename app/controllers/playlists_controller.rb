class PlaylistsController < ApplicationController

	def create
		@playlist = Playlist.new(playlist_params)
		@playlist.save
		redirect_to @playlist #goes to the show method

    def show
    	@playlist = Playlist.find(params[:id]) # Playlist.find(8)

    	respond_to do |format|
      		format.html # show.html.erb
      		format.json { render json: @playlist }
    	end
  	end

	end

	def new
		@playlist = Playlist.new
	end

	def index
		@playlists = Playlist.all
	end



  	def edit
  		@playlist = Playlist.find(params[:id])
  	end	

  	def update
  		@playlist = Playlist.find(params[:id])
     	@playlist.update_attributes(playlist_params)
    	redirect_to @playlist    
	  end

  	def destroy
  		@playlist = Playlist.find(params[:id])
   	 	@playlist.destroy
    	respond_to do |format|
      	format.html { redirect_to playlists_url, notice: 'Playlist was successfully destroyed.' }
      	format.json { head :no_content }
    	end
  	end

  	private
  	def playlist_params
  		params.require(:playlist).permit(:title, :link)
  	end

end