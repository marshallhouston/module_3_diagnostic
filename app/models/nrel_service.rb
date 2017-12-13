class NrelService

  def initialize
  end

  def all_by_zip_code(zip_code)
    # conn.get("?location=#{zip_code}")
    conn.get '/nearest', { :location => "#{zip_code}" }
  end

  private

  def conn
    Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1") do |faraday|
      faraday.params['api_key'] = ENV['nrel_api_key']
      faraday.params['format'] = 'json'
      faraday.params['radius'] = '6'
      faraday.params['fuel_type'] = 'ELEC,LPG'
      faraday.params['limit'] = 10
      faraday.adapter Faraday.default_adapter
    end
  end

end
