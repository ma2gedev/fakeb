class BookmarksController < ApplicationController
  def show
    user = User.find_by_name(params[:name])
    # @task must be consider when user == nil
    @user_name = user.name
    @bookmarks = user.bookmarks
  end
end
