require 'spec_helper'

describe CalenderController do

  describe "GET 'full_calender'" do
    it "returns http success" do
      get 'full_calender'
      response.should be_success
    end
  end

end
