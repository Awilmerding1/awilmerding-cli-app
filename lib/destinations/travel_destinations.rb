require 'open-uri'
class Destinations::TravelDestinations

  def self.scrape_webpage
    Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel"))
  end

  def self.scrape_top_ten
     lists = self.scrape_webpage
     counter = 1
     lists.css("a.js-page-navigation-spot span").each_with_index do |list, index|
       puts "#{index+1}. #{list.text}"
     end
  end

def self.scrape_top_countries
  list = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/countries"))
  counter = 1
  list.css("a.js-action-scroll-to span").each_with_index do |lists, index|
    puts "#{index+1}. #{lists.text}"
end
end

def self.scrape_top_cities
  list = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/cities"))
  counter = 1
  list.css("a.js-action-scroll-to span").each_with_index do |lists, index|
    puts "#{index+1}. #{lists.text}"
end
end

def self.scrape_top_regions
  list = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/regions"))
  counter = 1
  list.css("a.js-action-scroll-to span").each_with_index do |lists, index|
    puts "#{index+1}. #{lists.text}"
end
end

def self.scrape_top_value
  list = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/value"))
  counter = 1
  list.css("a.js-action-scroll-to span").each_with_index do |lists, index|
    puts "#{index+1}. #{lists.text}"
end
end


end
