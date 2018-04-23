require 'open-uri'
class Destinations::TopList

  def self.scrape_list
    Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/")).css("a.js-page-navigation-spot span").each_with_index do |list, index|
      puts "#{index+1}. #{list.text}"
    end
  end

  def self.scrape_countries
    doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/countries"))
    destination = Destinations::TravelDestinations.new(doc.css("a.js-action-scroll-to span").text, doc.css("a").attribute("href").text, doc.css(".masthead__sub_title").text)
    Destinations::TravelDestinations.all_countries << destination
  end

  def self.scrape_cities
    doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/cities"))
    destination = Destinations::TravelDestinations.new(doc.css("a.js-action-scroll-to span").text, doc.css("a").attribute("href").text, doc.css(".masthead__sub_title").text)
    Destinations::TravelDestinations.all_cities << destination
  end

  def self.scrape_regions
    doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/regions"))
    destination = Destinations::TravelDestinations.new(doc.css("a.js-action-scroll-to span").text, doc.css("a").attribute("href").text, doc.css(".masthead__sub_title").text)
    Destinations::TravelDestinations.all_regions << destination
  end

  def self.scrape_value
    doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/value"))
    destination = Destinations::TravelDestinations.new(doc.css("a.js-action-scroll-to span").text, doc.css("a").attribute("href").text, doc.css(".masthead__sub_title").text)
    Destinations::TravelDestinations.all_value << destination
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
