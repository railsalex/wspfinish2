# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r = Restaurant.new(name:"tttttt",start_time:"7:00",end_time:"19:00")
r.save
r = Restaurant.new(name:"xxxxxx",start_time:"7:00",end_time:"19:00")
r.save
r = Restaurant.new(name:"cccccc",start_time:"7:00",end_time:"19:00")
r.save

