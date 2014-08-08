require 'spec_helper'

describe HomeController do

  logged_in_user

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      #somebody went and changed this- it now *always
      expect(response).to redirect_to( day_path('today') )
    end
  end

end
