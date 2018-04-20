require 'open-uri'
class Destinations::TravelDestinations

  attr_accessor :url, :summary, :name, :link

  @@all = []

  def initialize(name, url, summary, link)
    @url = url
    @name = name
    @summary = summary
    @link = link
    @@all << self
  end

  


end
