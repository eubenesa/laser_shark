# This is definitely an overkill test.
#
require 'spec_helper'

describe 'Authentication' do

  context "with new user profile" do
    it 'creates a user record based on Github OAuth Response Hash' do
      FactoryGirl.create :user # => 1
      visit github_session_path
      expect(User.count).to eq(2)
    end

    it "defaults the user information based on Github" do
      visit github_session_path
      user = User.last
      expect(user.first_name).to eq('Khurram')
      expect(user.last_name).to eq('Virani')
      expect(user.github_username).to eq('kvirani')
      expect(user.email).to eq('kvirani@lighthouselabs.ca')
      expect(user.uid).to eq('uid')
      expect(user.token).to eq('token')
    end

    it "redirects to registration page" do
      visit github_session_path
      expect(current_path).to eq(new_registration_path)
    end
  end

  context "with existing registered user" do
    let!(:user) { FactoryGirl.create :user_for_auth }

    it "does not create a new user record" do
      visit github_session_path
      expect(User.count).to eq(1) # was already 1 due to FG.create above
    end

    it "redirects to home page (instead of registration page)" do
      visit github_session_path
      #we're expecting a brand new, unprepped user to be redirected to the prep path
      expect(current_path).to eq(prep_path)
    end
  end

  context "with existing unregistered user" do
    let!(:user) { FactoryGirl.create :unregistered_user, uid: "uid", token: "token" }

    it "does not create a new user record" do
      visit github_session_path
      expect(User.count).to eq(1) # was already 1 due to FG.create above
    end

    it "redirects to registration page" do
      visit github_session_path
      expect(current_path).to eq(new_registration_path) # was already 1 due to FG.create above
    end
  end

end
