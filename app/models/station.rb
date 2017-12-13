class Station

  attr_reader :name,
              :address,
              :fuel_types,
              :distance,
              :access_times

  def initialize(data)
    @name = data[:station_name]
    @address = data[:street_address]
    @fuel_types = data[:fuel_type_code]
    @distance = data[:distance]
    @access_times = data[:access_days_time]
  end
  
end
