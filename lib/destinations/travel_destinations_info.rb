require 'open-uri'
require 'pry'
class Destinations::TravelDestinations

  attr_accessor :name, :summary, :list_number, :link_url

  @@all = []
  
  def self.new_countries
   Destinations::TravelDestinationsLists.scrape_countries.each do |country|
     new_country = self.new
     new_country.name = country.css(".marketing-article__header h1").text.scan(/[a-zA-Z]+.*/).join
     new_country.link_url = country.css("a").attribute("href").text
     new_country.list_number = country.css(".marketing-article__header h1").text.scan(/\d+/).join.to_i
     new_country.summary = country.css("p.marketing-article__content").text
     self.all << new_country
   end
  end

  def self.new_cities
    Destinations::TravelDestinationsLists.scrape_cities.each do |city|
      new_city = self.new
      new_city.name = city.css(".marketing-article__header h1").text.scan(/[a-zA-Z]+.*/).join
      new_city.link_url = city.css("a").attribute("href").text
      new_city.list_number = city.css(".marketing-article__header h1").text.scan(/\d+/).join.to_i
      new_city.summary = city.css("p.marketing-article__content").text
      self.all << new_city
    end
  end

  def self.new_regions
    Destinations::TravelDestinationsLists.scrape_regions.each do |region|
      new_region = self.new
      new_region.name = region.css(".marketing-article__header h1").text.scan(/[a-zA-Z]+.*/).join
      new_region.link_url = region.css("a").attribute("href").text
      new_region.list_number = region.css(".marketing-article__header h1").text.scan(/\d+/).join.to_i
      new_region.summary = region.css("p.marketing-article__content").text
      self.all << new_region
    end
   end

  def self.new_value
    Destinations::TravelDestinationsLists.scrape_value.each do |value|
      new_value = self.new
      new_value.name = value.css(".marketing-article__header h1").text.scan(/[a-zA-Z]+.*/).join
      new_value.link_url = value.css("a").attribute("href").text
      new_value.list_number = value.css(".marketing-article__header h1").text.scan(/\d+/).join.to_i
      new_value.summary = value.css("p.marketing-article__content").text
      self.all << new_value
    end
   end

  def self.all
      @@all
  end

  def self.put_all
    self.all.each_with_index do |destination, index|
      puts "#{index+1}. #{destination.name}"
    end
  end


  def self.find_input_to_index(input, more_input)
    if input.to_i == 1
      self.all[more_input.to_i-1]
    elsif input.to_i == 2
      self.all[10 + more_input.to_i-1]
    elsif input.to_i == 3
      self.all[20 + more_input.to_i-1]
    elsif input.to_i == 4
      self.all[30 + more_input.to_i-1]
    end
  end


end
