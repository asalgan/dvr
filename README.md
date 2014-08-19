DVR

================
Notes

- Rather than having the user enter schedules, date, timespan, etc., I seeded the database with 6 existing "shows" that they can select to record. It makes more sense for the end user to find a show they like and select it (like with current DVR systems) as opposed to having the user enter that data (as was the case with VCR's)
- The DVR page lists all boxes in their current DVR system (2 boxes), and which shows are currently being recorded to each box. This was done to provide the user with easy access to current recordings, as well as delete current recordings. 
- The shows page that lists shows that can be recorded is listed by channel number. If there was more time, it would also make sense to include a search feature for the user to search by the name of the show. 
- The user also has the option to select whichever box they want to record on, and it automatically checks if that time-slot is already taken and doesn't go through with the recording process. 
- If it does go through with the recording process, the shows page shows the show that is being recorded. the "record" button chances to "cancel" if you want to cancel a recording, and the recording also shows up on the DVR main page as well.
- I wrote 48 tests for all of the various functionalities and page views which are all passing

Completed couple of the Extensions. User can see currently recording shows, or pick from a list of shows to record, as well as select a box to record on that's currently free during that recording time period. 
 

What else should the DVR app be able to do:

1. If show is being recorded on one box and user selects a show to record that overlaps, it should automatically check if the other box is available rather than having user guess and check
2. If show overlaps another show recording, user should have option to overwrite the recording with new show that was selected (in process of implementing)
3. Selecting “record” or “cancel” on shows index page should submit ajax request rather than page refresh (user may want to record multiple shows, and if there’s a long list they shouldn’t have to start again at the top) - more of a nice to have rather than necessity at this point

What gave me some trouble

I believe there is either an issue or something I haven't figured out yet with Rails 4.1 and the respond_to do |format| block when you do format.js in Rails 4.1.0. I tried implementing an AJAX call that tells the user which show is currently recording (which I am able to pull using @overlapping_shows) but couldn't get that piece to work. 