require 'rails_helper'

describe "User can search by zip_code" do
  context "for electric and propane stations" do
    context "limited to 10 stations within 6 miles sorted by distance" do
      scenario "and see station info including name, address, fuel types, distance, and access times" do
        VCR.use_cassette('search_by_zip_code') do
          # As a user
          # When I visit "/"
          visit "/"
          # And I fill in the search form with 80203
          fill_in 'zip_code', with: "80203"
          # And I click "Locate"
          click_on "Locate"
          # Then I should be on page "/search" with parameters visible in the url

          expect(current_url).to include('zip_code=80203')

          # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
          within ".stations" do
            expect( all('.station-name').count ).to eq(10)
          end

          # And the stations should be limited to Electric and Propane

          # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
          within first(".station-info") do
            expect(page).to have_css('.station-name')
            expect(page).to have_css('.station-address')
            expect(page).to have_css('.station-fuel_types')
            expect(page).to have_css('.station-distance')
            expect(page).to have_css('.station-access_times')
          end
        end
      end
    end
  end
end
