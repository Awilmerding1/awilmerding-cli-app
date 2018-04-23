require 'open-uri'
require 'pry'
class Destinations::TravelDestinationsLists

  def self.scrape_list
    Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/")).css("a.js-page-navigation-spot span").each_with_index do |list, index|
      puts "#{index+1}. #{list.text}"
    end
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


  def self.puts_countries
    self.scrape_countries.css(".marketing-article__header h1").each do |lists|
      puts lists.text
    end
  end

  def self.puts_cities
    self.scrape_cities.css(".marketing-article__header h1").each do |lists|
      puts lists.text
    end
  end

  def self.puts_regions
    self.scrape_regions.css(".marketing-article__header h1").each do |lists|
    puts lists.text
    end
  end


  def self.puts_value
    self.scrape_value.css(".marketing-article__header h1").each do |lists|
      puts lists.text
    end
  end

end
