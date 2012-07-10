class Entry < ActiveRecord::Base
  has_many :bookmarks
  attr_accessible :title, :url
end
