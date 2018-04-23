require 'open-uri'
class Destinations::TravelDestinations

  attr_accessor :name, :summary, :list_number, :link_url, :list

  @@all = []
  @@all_countries = []
  @@all_cities = []
  @@all_regions = []
  @@all_value = []

  def initialize(name, list_number, list)
    @name = name
    @list_number = list_number
    @list = list
    @@all << self
  end

  def summary
    self.summary ||= doc.css("##{self.list_number} .marketing-article__content").text
  end

  def link_url
    self.link_url ||= doc.css("##{self.list_number} .marketing-article__content a").attribute("href").text
  end

  def self.find_country_destination(input.to_i)
      self.all_countries[input.to_i + 1]
  end

  def self.find_city_destination(input.to_i)
    self.all_cities[input.to_i + 1]
  end

  def self.find_region_destination(input.to_i)
    self.all_regions[input.to_i + 1]
  end

  def self.find_value_destination(input.to_i)
    self.all_value[input.to_i + 1]
  end


end
