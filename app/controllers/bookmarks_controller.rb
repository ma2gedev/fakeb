require 'open-uri'
require 'timeout'
require 'nokogiri'

class BookmarksController < ApplicationController
  before_filter :authenticate_user, :except => ["index"]

  def index
    user = User.find_by_name(params[:name])
    # @task must be consider when user == nil
    @user_name = user.name
    @bookmarks = user.bookmarks.sort { |a, b| b.created_at <=> a.created_at }
  end
  
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(params[:bookmark])

    url = params[:entry][:url]
    entry = Entry.find_by_url(url)
    entry ||= Entry.new
    entry.url = url
    entry.title = fetch_page_data(url) if entry.title.blank?

    exist = Bookmark.find_by_entry_id_and_user_id(entry.id, current_user.id)
    if exist
      # @task set flash message
      render :new
      return
    end

    @bookmark.user = current_user
    @bookmark.entry = entry
    if @bookmark.save
      redirect_to :action => :index, :name => current_user.name
    else
      render :new
    end
  end

  private

  def fetch_page_data(url)
    html = nil
    begin
      timeout(10) do
        html = Nokogiri::HTML(open(url))
      end
    rescue => exception
      # puts exception
      return url
    end

    title = html.css('title').first
    return url if title == nil

    title.text
  end
end
