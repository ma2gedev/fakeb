class TopController < ApplicationController
  def index
    # BAD way, because heroku shared database has bugs that fixed by PostgreSQL 9.1
    # See Also: http://stackoverflow.com/questions/10066041/heroku-pgerror-error-column-must-appear-in-the-group-by-clause-or-be-used-i
    # should be the following code commented out
    # @entries = Entry.select("entries.title, entries.url, count(*) AS count").joins(:bookmarks).
    #              group("bookmarks.entry_id").order("count desc")
    @bookmarks = Bookmark.select("entry_id, count(*) AS count").group("entry_id").order("count desc").includes(:entry)
  end
end
