require 'open-uri'
require 'pry'
class Destinations::TravelDestinationScraper

  @@scraped_list = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/")).css("a.js-page-navigation-spot span")

  def self.scraped_list
    @@scraped_list
  end

  def self.scrape_countries
    Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/countries")).css(".marketing-article")
  end

  def self.scrape_cities
     Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/cities")).css(".marketing-article")
  end

  def self.scrape_regions
    Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/regions")).css(".marketing-article")
  end

  def self.scrape_value
    Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/value")).css(".marketing-article")
  end


end
