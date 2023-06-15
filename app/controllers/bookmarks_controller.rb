class BookmarksController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @bookmarks = @list.bookmarks
  end

  def show
    @bookmark = Bookmark.find(params[:list_id])
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(params_bookmark)
    @bookmark.list = @list
    if @bookmark.save!
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark), status: :see_other
  end

private

  def params_bookmark
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
