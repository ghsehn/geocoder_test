class Place < ActiveRecord::Base
  geocoded_by :address       # can also be an IP address
  after_validation :geocode  # auto-fetch coordinates

  def google_maps_url
    "https://www.google.com.br/maps?q=#{coordinates}"
  end

  def google_maps_embed_url
    "#{google_maps_url}&output=embed"
  end

  def coordinates
    "#{latitude},#{longitude}"
  end
end
