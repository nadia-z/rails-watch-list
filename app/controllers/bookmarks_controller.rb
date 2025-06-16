class BookmarksController < ApplicationController
before_action :set_list, only: [:new, :create]

  def new
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @list.bookmarks.new(bookmark_params)
     if @bookmark.save
      redirect_to list_path(@list), notice: "Bookmark created!"
    else
       @bookmarks = @list.bookmarks.includes(:movie)
      render "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list), status: :see_other
  end
  private

  def set_list
    @list = List.find(params[:list_id] || params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
