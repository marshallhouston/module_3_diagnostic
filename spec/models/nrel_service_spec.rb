require 'rails_helper'

describe NrelService do
  subject { NrelService.new }
  it "exists" do
    expect(subject).to be_a NrelService
  end

  describe "instance_methods" do
    context "#all_by_zip_code" do
      it "searches for stations by zip_code and returns 10 stations within 6 miles" do
        VCR.use_cassette('NrelService#all_by_zip_code') do
          request = subject.all_by_zip_code("80207")
          stations = JSON.parse(request.body)
          station = stations.first

          expect(stations.count).to eq 10
          expect(station['distance']).to be < 6
        end
      end
    end
  end
end
