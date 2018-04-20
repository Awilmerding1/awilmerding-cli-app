require 'open-uri'
class Destinations::TopList

  attr_accessor :name, :url, :destinations

  @@all_destinations = []

  def initialize(name, url)
    @name = name
    @url = url
    @destinations = []
  end

  def add_destination(destination)
    self.destinations << destination
  end

  def destinations
    @destinations
  end

  def self.scrape_countries
    doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/countries"))
    list = self.new(doc.css("a h2").text, "https://www.lonelyplanet.com/best-in-travel/countries")
  end

  def self.scrape_cities
    doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/cities"))
    list = self.new(doc.css("a h2").text, "https://www.lonelyplanet.com/best-in-travel/cities")
  end

  def self.scrape_regions
    doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/regions"))
    list = self.new(doc.css("a h2").text, "https://www.lonelyplanet.com/best-in-travel/regions")
  end



end
