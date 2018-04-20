require 'open-uri'
class Destinations::TravelDestinations

  attr_accessor :name, :summary, :list_number, :link_url, :list_url

  @@all = []

  def initialize(name, list_number, list_url)
    @name = name
    @list_number = list_number
    @list_url = list_url
    @@all << self
  end

  def self.new_from_list
    self.scrape_top_countries.map do|new_destination|
      new_destination.new(doc.css("a.js-action-scroll-to span").text, doc.css(".marketing-article__header h1").scan(/\w\d/),'https://www.lonelyplanet.com/best-in-travel/countries')
    end
    self.scrape_top_cities.map do|new_destination|
      new_destination.new(doc.css("a.js-action-scroll-to span").text, doc.css(".marketing-article__header h1").scan(/\w\d/),'https://www.lonelyplanet.com/best-in-travel/cities')
    end
    self.scrape_top_regions.map do|new_destination|
      new_destination.new(doc.css("a.js-action-scroll-to span").text, doc.css(".marketing-article__header h1").scan(/\w\d/),'https://www.lonelyplanet.com/best-in-travel/regions')
    end
    self.scrape_top_value.map do|new_destination|
      new_destination.new(doc.css("a.js-action-scroll-to span").text, doc.css(".marketing-article__header h1").scan(/\w\d/),'https://www.lonelyplanet.com/best-in-travel/value')
    end
  end

  def doc
    self.doc ||= Nokogiri::HTML(open(self.list_url))
  end

  def summary
    self.summary ||= doc.css("##{self.list_number} .marketing-article__content").text
  end

  def link_url
    self.link_url ||= doc.css("##{self.list_number} .marketing-article__content a")["href"]
  end

  def self.all
    @@all
  end

  def self.scrape_top_ten
     lists = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/"))
     counter = 1
     lists.css("a.js-page-navigation-spot span").each_with_index do |list, index|
       puts "#{index+1}. #{list.text}"
     end
  end

def self.scrape_top_countries
  list = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/countries"))

end

def self.scrape_top_cities
  list = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/cities"))
end

def self.scrape_top_regions
  list = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/regions"))
end

def self.scrape_top_value
  list = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/value"))
end

def puts_destinations
  self.list_url.css("a.js-action-scroll-to span").each_with_index do |lists, index|
  puts "#{index+1}. #{lists.text}"
  end
end

end
