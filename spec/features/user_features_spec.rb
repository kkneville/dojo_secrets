require 'rails_helper'
feature 'User features ' do
  feature "user sign-up" do
    scenario 'visits sign-up page'

    scenario "with improper inputs, redirects back to sign in and shows validations"
    scenario "with proper inputs, create user and redirects to login page"
  end
  feature "user dashboard" do 
    scenario "displays user information" 
  end
end
