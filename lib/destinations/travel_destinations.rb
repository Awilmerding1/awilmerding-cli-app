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

end
