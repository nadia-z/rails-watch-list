class ListsController < ApplicationController
  before_action :find_list, only: [:show]

  def index
    @lists = List.all
  end

  def show
    @bookmarks = @list.bookmarks.includes(:movie)
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to root_path
  end

  private

  def find_list
    @list = List.find(params[:id] || params[:list_id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
