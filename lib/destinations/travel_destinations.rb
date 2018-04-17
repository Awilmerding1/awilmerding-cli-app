require 'open-uri'
class Destinations::TravelDestinations

  def self.scrape_webpage
    Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel"))
  end

  def self.scrape_top_ten
     lists = self.scrape_webpage
     counter = 1
     lists.css("a.js-page-navigation-spot span").map do |list|
       puts  list.text
     end
  end

end
