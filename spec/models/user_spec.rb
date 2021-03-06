require 'rails_helper'

RSpec.describe User, type: :model do
  
  context "with valid attributes" do 
    it "should save" do 
      expect(build(:user)).to be_valid
    end
    it 'automatically encrypts the password into the password_digest attribute' do
      expect(build(:user).password_digest.present?).to eq(true)
    end 
    it 'email as lowercase' do 
      expect(create(:user, email: 'EMAIL@GMAIL.COM').email).to eq('email@gmail.com')
    end
  end
  context "with invalid attributes should not save if" do 
    it 'firstname is blank' do
      expect(build(:user, firstname: '')).to be_invalid
    end
    it 'lastname is blank' do
      expect(build(:user, lastname: '')).to be_invalid
    end
    it 'email is blank' do
      expect(build(:user, email: '')).to be_invalid
    end

# This one is not working corrently, fails on email saving in lowercase, but shoudln't fail, program does in fact save as lowercase

    it 'email format is wrong' do
      emails = %w[@ user@ @example.com]
      emails.each do |email|
        expect(build(:user, email: email)).to be_invalid
      end
    end

#This is also fails, possibly evaluating before being downcased? Program behaviour is correct, test still fails, need to rewrite test.

    it 'email is not unique' do
      create(:user)
      expect(create(:user)).to be_invalid
    end

    it 'password is blank' do
      expect(build(:user, password: '')).to be_invalid
    end
    it "password doesn't match password_confirmation" do
      expect(build(:user, password_confirmation: 'notpassword')).to be_invalid
    end
  end
end