class TopController < ApplicationController
  def index
    @entries = Entry.select("entries.title, entries.url, count(*) AS count").joins(:bookmarks).group("bookmarks.entry_id").order("count desc")
  end
end
