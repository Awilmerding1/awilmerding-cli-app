require 'open-uri'
class Destinations::TravelDestinationsInfo

  def self.scrape_for_description(input_url, more_input)
    description = Nokogiri::HTML(open(input_url))
    description.css("##{more_input} .marketing-article__content").each do |pgh|
      puts pgh.text
    end
  end

  def self.scrape_for_link(input_url, more_input)
    link = Nokogiri::HTML(open(input_url))
    link.css("##{more_input} .marketing-article__content a").each do |more|
      puts "Copy and paste the link below into your browser to read more about this destination."
      puts more["href"]
    end
  end



end
