class EntriesController < ApplicationController
  def show
    @entry = Entry.find(params[:id])
    @bookmarks = @entry.bookmarks
  end
end
