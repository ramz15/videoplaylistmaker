class PlaylistsController < ApplicationController

	def create
		@playlist = Playlist.new(playlist_params)
		@playlist.save
		redirect_to @playlist #goes to the show method

		    # @book = Book.new(book_params)

  #   respond_to do |format|
  #     if @book.save
  #       format.html { redirect_to @book, notice: 'Book was successfully created.' }
  #       format.json { render :show, status: :created, location: @book }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @book.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
	end

	def new
		@playlist = Playlist.new
	end

	def index
		@playlists = Playlist.all
	end

    def show
    	@playlist = Playlist.find(params[:id]) # Playlist.find(8)

    	respond_to do |format|
      		format.html # show.html.erb
      		format.json { render json: @playlist }
    	end
  	end

  	def edit
  		@playlist = Playlist.find(params[:id])
  	end	

  	def update
  		@playlist = Playlist.find(params[:id])
    respond_to do |format|
      if @playlist.update_attributes(playlist_params)
        format.html { redirect_to @playlist, notice: 'PLaylistwas successfully updated.' }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
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