class TopController < ApplicationController
  def index
    @entries = Entry.order("updated_at DESC")
  end
end
