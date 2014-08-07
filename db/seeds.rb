# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

DvrSystem.destroy_all
Box.destroy_all
Show.destroy_all

DvrSystem.create(:user_id => User.last.id)

Box.create(box_number:"1", :dvr_system_id => DvrSystem.last.id)
Box.create(box_number:"2", :dvr_system_id => DvrSystem.last.id)


t = Time.now
end_time_half_hour = t + 30.minutes
end_time_full_hour = t + 60.minutes

Show.create(title:"The Fox", :channel => 22, :start_time => Time.now, :end_time => end_time_half_hour.strftime("%H:%M"))
Show.create(title:"Simpsons", :channel => 37, :start_time => Time.now.strftime("%H:%M"), :end_time => end_time_half_hour.strftime("%H:%M"))
Show.create(title:"Documentary", :channel => 159, :start_time => Time.now.strftime("%H:%M"), :end_time => end_time_full_hour.strftime("%H:%M"))
Show.create(title:"Family Guy", :channel => 12, :start_time => Time.now.strftime("%H:%M"), :end_time => end_time_full_hour.strftime("%H:%M"), :single_recording => false)
Show.create(title:"The League", :channel => 34, :start_time => Time.now.strftime("%H:%M"), :end_time => end_time_full_hour.strftime("%H:%M"), :single_recording => false, :box_id => DvrSystem.last.boxes.find_by(:box_number => 1).id)
Show.create(title:"Goats", :channel => 20, :start_time => Time.now.strftime("%H:%M"), :end_time => end_time_full_hour.strftime("%H:%M"), :box_id => DvrSystem.last.boxes.find_by(:box_number => 2).id)
