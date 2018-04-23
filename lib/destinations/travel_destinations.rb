require 'open-uri'
class Destinations::TopList

  def self.scrape_list
    Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/")).css("a.js-page-navigation-spot span").each_with_index do |list, index|
      puts "#{index+1}. #{list.text}"
    end
  end

  def self.scrape_countries
    doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/countries"))
  end

  def self.scrape_cities
    doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/cities"))
  end

  def self.scrape_regions
    doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/regions"))
  end

  def self.scrape_value
    doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/value"))
  end

  def self.puts_countries
    selfscrape_countries.css("a.js-action-scroll-to span").each_with_index do |lists, index|
    puts "#{index+1}. #{lists.text}"
    end
  end

  def self.puts_cities
    selfscrape_cities.css("a.js-action-scroll-to span").each_with_index do |lists, index|
    puts "#{index+1}. #{lists.text}"
    end
  end

  def self.puts_regions
    selfscrape_regions.css("a.js-action-scroll-to span").each_with_index do |lists, index|
    puts "#{index+1}. #{lists.text}"
    end
  end


  def self.puts_value
    selfscrape_value.css("a.js-action-scroll-to span").each_with_index do |lists, index|
    puts "#{index+1}. #{lists.text}"
    end
  end

end
