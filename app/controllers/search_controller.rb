class SearchController < ApplicationController

  def index
    request = Faraday.get('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest') do |faraday|
      faraday.params['api_key'] = ENV['nrel_api_key']
      faraday.params['format'] = 'json'
      faraday.params['radius'] = '6'
      faraday.params['format'] = 'json'
      faraday.params['fuel_type'] = 'ELEC,LPG'
      faraday.params['limit'] = 10
      faraday.params['location'] = params[:q]
    end

    parsed_response = JSON.parse(request.body, symbolize_headers: true)
    parsed_stations = parsed_response['fuel_stations']

    @stations = parsed_stations
  end

end
