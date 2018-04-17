class Destinations::CLI

  attr_accessor :countries

  def call
    Destinations::TravelDestinations.scrape_top_ten
    intro
    main_menu_select
    # Destinations::TravelDestinations.scrape_top_countries
    # Destinations::TravelDestinations.scrape_top_cities
    # Destinations::TravelDestinations.scrape_top_regions
    # Destinations::TravelDestinations.scrape_top_value
  end

  def intro
    puts "Welcome! Please select one of the lists above by number or keyword."
    puts "Type 'exit' to exit the program."
  end

  def main_menu_select
    input = gets.chomp.downcase
    if input.to_i == 1 || input.include?("countries")
    Destinations::TravelDestinations.scrape_top_lists("https://www.lonelyplanet.com/best-in-travel/countries")
  elsif input.to_i == 2 || input.include?("cities")
    Destinations::TravelDestinations.scrape_top_lists("https://www.lonelyplanet.com/best-in-travel/cities")
  elsif input.to_i == 3 || input.include?("regions")
    Destinations::TravelDestinations.scrape_top_lists("https://www.lonelyplanet.com/best-in-travel/regions")
  elsif input.to_i == 4 || input.include?("value") || input.include?("best")
    Destinations::TravelDestinations.scrape_top_lists("https://www.lonelyplanet.com/best-in-travel/value")


    # if input.to_i > 4 || input.to_i < 1
    #   puts "Please enter a number on the list."
  end
end

end
