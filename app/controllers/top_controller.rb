class TopController < ApplicationController
  def index
    @entries = Entry.all
  end
end
