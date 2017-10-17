require 'rails_helper'
feature 'authentication' do
  before do
    @user = create(:user)
  end

#Passes!!!
  feature "user sign-in" do
    scenario 'visits sign-in page' do
      visit '/login'
      expect(page).to have_field('user[email]')
      expect(page).to have_field('user[password]')
    end

# Fails 
    scenario 'logs in user if email/password combination is valid' do
      log_in
      expect(current_path).to eq("user_path user.id")
      expect(page).to have_text(@user.firstname)
    end

#Fails
    scenario 'does not sign in user if email is not found' do
      log_in email: 'wrong email'
      expect(current_path).to eq("/login")
      expect(page).to have_text('Email and password do not match')
    end

#Fails
    scenario 'does not sign in user if email/password combination is invalid' do
      log_in password: 'wrong password'
      expect(current_path).to eq("/login")      
      expect(page).to have_text('Email and password do not match')
    end
  end

#both fail
  feature "user to log out" do
    before do 
      log_in 
    end
    scenario 'displays "Logout" button when user is logged on' do
      expect(page).to have_button('Logout')
    end

    scenario 'logs out user and redirects to login page' do
      click_button 'Logout'
      expect(current_path).to eq('/login')
    end
  end
end

