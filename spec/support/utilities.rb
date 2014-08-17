include ApplicationHelper

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def sign_in(user, options={})
  visit new_user_session_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def record_show(show)
	show_attr = FactoryGirl.attributes_for(:show).merge(:box_id => box.id)
	box_attr = { :box => FactoryGirl.attributes_for(:box) }
	show_and_box_attr = { :show => show_attr }.merge(box_attr)
	visit show_record_path(show, show_and_box_attr)
	show.save!
end

