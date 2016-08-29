class User < ActiveRecord::Base
  has_many :deliveries

  def User.search_plunger_requestors(latitude, longitude, radius_in_meters)
    requestors = User.where("ST_DWithin(location, 'POINT(? ?)', ?)", longitude, latitude, radius_in_meters)#.order("ST_Distance(location, 'POINT(? ?)', ?)", longitude, latitude)
    return requestors
  end

  def latitude
    self.location.lat
  end

  def longitude
    self.location.lon
  end

  def as_json(options={})
    options.merge!(:methods => [:latitude, :longitude])
    super(options)
  end
end
