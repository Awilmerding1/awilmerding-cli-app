class Destinations::CLI

  attr_accessor :countries

  def call
    Destinations::TravelDestinations.scrape_top_ten
    intro
    main_menu_select
  end

  def intro
    puts "Welcome! Please select one of the lists above by number or keyword."
    puts "Type 'exit' to exit the program."
  end


  def main_menu_select
    input = nil
    while input != "exit"
      input = gets.chomp.downcase
    if input.to_i == 1 || input.include?("countries")
      Destinations::TravelDestinations.scrape_top_lists("https://www.lonelyplanet.com/best-in-travel/countries")
      puts "If you would like to read about one of these destinations, please enter it's number on the list."
      self.destination_more_info("https://www.lonelyplanet.com/best-in-travel/countries")
    end
    if input.to_i == 2 || input.include?("cities")
      Destinations::TravelDestinations.scrape_top_lists("https://www.lonelyplanet.com/best-in-travel/cities")
      puts "If you would like to read about one of these destinations, please enter it's number on the list."
      self.destination_more_info("https://www.lonelyplanet.com/best-in-travel/cities")
    end
    if input.to_i == 3 || input.include?("regions")
      Destinations::TravelDestinations.scrape_top_lists("https://www.lonelyplanet.com/best-in-travel/regions")
      puts "If you would like to read about one of these destinations, please enter it's number on the list."
      self.destination_more_info("https://www.lonelyplanet.com/best-in-travel/regions")
    end
    if input.to_i == 4 || input.include?("value") || input.include?("best")
      Destinations::TravelDestinations.scrape_top_lists("https://www.lonelyplanet.com/best-in-travel/value")
      puts "If you would like to read about one of these destinations, please enter it's number on the list."
      self.destination_more_info("https://www.lonelyplanet.com/best-in-travel/value")
    end
    end
  end

  def destination_more_info(input_url)
    more_input = nil
    while more_input != "exit"
    more_input = gets.chomp.downcase
    if more_input.to_i.between?(1,10)
    Destinations::TravelDestinations.scrape_for_description(input_url, more_input.to_i)
  end
  end
end


end
