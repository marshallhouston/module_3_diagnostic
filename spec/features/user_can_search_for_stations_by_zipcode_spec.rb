require 'rails_helper'

describe "User can search by zip_code" do
  context "for electric and propane stations" do
    context "limited to 10 stations within 6 miles sorted by distance" do
      scenario "and see station info including name, address, fuel types, distance, and access times" do

        # As a user
        # When I visit "/"
        visit "/"
        # And I fill in the search form with 80203
        fill_in 'search-field', with: "80203"
        # And I click "Locate"
        click_on "Locate"
        # Then I should be on page "/search" with parameters visible in the url
        expect(current_path).to eq("/search")
        # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
        # And the stations should be limited to Electric and Propane
        # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

      end
    end
  end
end
