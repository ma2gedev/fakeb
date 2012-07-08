# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(taka tetsu nya).each do |name|
  user = User.new
  user.name = name
  user.password = "password"
  user.password_confirmation = "password"
  user.save!
end
