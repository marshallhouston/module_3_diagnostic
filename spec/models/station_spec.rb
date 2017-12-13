require 'rails_helper'

describe Station do
  it "initializes with data" do
    data = {"access_days_time"=>"Fleet use only",
            "fuel_type_code"=>"ELEC",
            "station_name"=>"City of Denver - Waterboard Garage",
            "street_address"=>"1340 Cherokee St",
            "distance"=>0.65248}

    station = Station.new(data)

    expect(station).to be_a Station
  end
end
