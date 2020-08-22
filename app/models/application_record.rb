class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def address
    [address_street, address_city, postcode, prefecture_code].compact.join(', ')
  end
  geocoded_by :address, latitude: :lat, longitude: :lon
end
