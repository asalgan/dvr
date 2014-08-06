# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

DvrSystem.destroy_all
Box.destroy_all

DvrSystem.create(:user_id => User.last.id)

Box.create(box_number:"1", :dvr_system_id => DvrSystem.last.id)
Box.create(box_number:"2", :dvr_system_id => DvrSystem.last.id)
