require 'open-uri'
class Destinations::TravelDestinations

  attr_accessor :name, :summary, :list_number, :link_url, :list

  @@all_countries = []
  @@all_cities = []
  @@all_regions = []
  @@all_value = []

  def initialize(name, list_number, list)
    @name = name
    @list_number = list_number
    @list = list
  end

  def summary
    self.summary ||= doc.css("##{self.list_number} .marketing-article__content").text
  end

  def link_url
    self.link_url ||= doc.css("##{self.list_number} .marketing-article__content a").attribute("href").text
  end

  def self.all
    @@all
  end

  def self.find_destination_from_list(list)
    self.all.map do |destinations|
      if destinations.list == list

  end


end
