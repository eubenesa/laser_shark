require 'spec_helper'

describe PrepController do

  # Added the student login because authentication is now required
  logged_in_student

  describe "GET 'show'" do

    it "returns http success" do
      get 'show'
      response.should be_success
    end

  end

end
