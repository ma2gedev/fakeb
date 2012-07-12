# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  %w(taka tetsu nya).each do |name|
    user = User.new
    user.name = name
    user.password = "password"
    user.password_confirmation = "password"
    user.save!
  end
  
  %w(http://www.yahoo.co.jp/0 http://www.yahoo.co.jp/1 http://www.yahoo.co.jp/2).each do |url|
    entry = Entry.new
    entry.url = url
    entry.title = url
    entry.save!
  end
  
  %w(comment1 comment2 comment3).each_with_index do |comment, i|
    bookmark = Bookmark.new
    bookmark.comment = comment
    bookmark.user = User.find(1)
    bookmark.entry = Entry.find(i + 1)
    bookmark.save!
  end
end

