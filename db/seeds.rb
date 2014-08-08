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

Show.create(title:"The Fox", :channel => 22, :start_time => Time.now, :end_time => end_time_half_hour)
Show.create(title:"Simpsons", :channel => 37, :start_time => Time.now, :end_time => end_time_half_hour)
Show.create(title:"Documentary", :channel => 159, :start_time => Time.now, :end_time => end_time_full_hour)
Show.create(title:"Family Guy", :channel => 12, :start_time => Time.now, :end_time => end_time_full_hour, :single_recording => false)
Show.create(title:"The League", :channel => 34, :start_time => Time.now, :end_time => end_time_full_hour, :single_recording => false)
Show.create(title:"Goats", :channel => 20, :start_time => Time.now, :end_time => end_time_full_hour, :box_id => Box.find_by(:box_number => 2).id)
Show.create(title:"Funniest Home Videos", :channel => 45, :start_time => Time.now+205.minutes, :end_time => end_time_full_hour, :box_id => Box.find_by(:box_number => 2).id)
