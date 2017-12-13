class SearchController < ApplicationController

  def index

    request = nrel_service.all_by_zip_code(params[:zip_code])

    parsed_response = JSON.parse(request.body, symbolize_names: true)
    parsed_stations = parsed_response[:fuel_stations]

    stations = parsed_stations.map do |raw_station|
      Station.new(raw_station)
    end

    @stations = stations
  end

  private

  def nrel_service
    @nrel_service ||= NrelService.new
  end
end
