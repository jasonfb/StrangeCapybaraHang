require 'rails_helper'

describe "client app", type: :feature  do
  describe "when starting the experience", type: :feature do
    # TODO: figure out why capy is hanging here

    it "can load the home page" do
      # THIS CAUSES HANG
      Capybara.using_session("client session") do
        visit "/"

      end
    end

    it "loads with a client id" do
      visit '/'
    end
  end
end
