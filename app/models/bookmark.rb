class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :entry
  attr_accessible :comment
end
