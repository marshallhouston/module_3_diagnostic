class NrelService

  def initialize
  end

  def all_by_zip_code(zip_code)
    Faraday.get('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest') do |faraday|
      faraday.params['api_key'] = ENV['nrel_api_key']
      faraday.params['format'] = 'json'
      faraday.params['radius'] = '6'
      faraday.params['fuel_type'] = 'ELEC,LPG'
      faraday.params['limit'] = 10
      faraday.params['location'] = zip_code
    end
  end


end
