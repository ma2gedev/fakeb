class BookmarksController < ApplicationController
  def show
    user = User.find_by_name(params[:name])
    # @task must be consider when user == nil
    @user_name = user.name
    @bookmarks = user.bookmarks
  end
  
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(params[:bookmark])

    url = params[:entry][:url]
    entry = Entry.find_or_create_by_url(url)
    entry.title = url if entry.title.blank?
    # @task access to url and get html title

    exist = Bookmark.find_by_entry_id_and_user_id(entry.id, current_user.id)
    if exist
      # @task set flash message
      render :new
      return
    end

    @bookmark.user = current_user
    @bookmark.entry = entry
    if @bookmark.save
      redirect_to :action => :show, :name => current_user.name
    else
      render :new
    end
  end
end
