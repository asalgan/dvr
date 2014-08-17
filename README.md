DVR
================
Notes

Completed couple of the Extensions. User can see currently recording shows, or pick from a list of shows to record, as well as select a box to record on that's currently free during that recording time period. 
 

What else should the DVR app be able to do:

1. If show is being recorded on one box and user selects a show to record that overlaps, it should automatically check if the other box is available rather than having user guess and check
2. If show overlaps another show recording, user should have option to overwrite the recording with new show that was selected (in process of implementing)
3. Selecting “record” or “cancel” on shows index page should submit ajax request rather than page refresh (user may want to record multiple shows, and if there’s a long list they shouldn’t have to start again at the top) - more of a nice to have rather than necessity at this point

Where I got stuck

I believe there is either an issue or something I can't figure out yet with Rails 4.1 and the respond_to do |format| block when you do format.js in Rails 4.1.0. I tried implementing an AJAX call that tells the user which show is currently recording (which I am able to pull using @overlapping_shows) but couldn't get that piece to work. 