class Destinations::CLI

  def call
    intro
    main_menu_select
  end

  def intro
    Destinations::TravelDestinations.scrape_top_ten
    puts "Welcome! Please select one of the lists above by number or keyword."
    puts "Type 'exit' to exit the program."
  end

  def main_menu
    Destinations::TravelDestinations.scrape_top_ten
    puts "Welcome! Please select another list."
    self.main_menu_select
  end

  def main_menu_select
    input = nil
    while input != "exit" && input != "main menu"
      input = gets.chomp.downcase
    if input.to_i == 1 || input.include?("countries")
      Destinations::TravelDestinations.scrape_top_countries
      puts "If you would like to read about one of these destinations, please enter it's number on the list."
      puts "To exit the program, enter 'exit'. To return to the main menu, enter 'main menu'."
      self.destination_more_info("https://www.lonelyplanet.com/best-in-travel/countries")
    end
    if input.to_i == 2 || input.include?("cities")
      Destinations::TravelDestinations.scrape_top_cities
      puts "If you would like to read about one of these destinations, please enter it's number on the list."
      puts "To exit the program, enter 'exit'. To return to the main menu, enter 'main menu'."
      self.destination_more_info("https://www.lonelyplanet.com/best-in-travel/cities")
    end
    if input.to_i == 3 || input.include?("regions")
      Destinations::TravelDestinations.scrape_top_regions
      puts "If you would like to read about one of these destinations, please enter it's number on the list."
      puts "To exit the program, enter 'exit'. To return to the main menu, enter 'main menu'."
      self.destination_more_info("https://www.lonelyplanet.com/best-in-travel/regions")
    end
    if input.to_i == 4 || input.include?("value") || input.include?("best")
      Destinations::TravelDestinations.scrape_top_value
      puts "If you would like to read about one of these destinations, please enter it's number on the list."
      puts "To exit the program, enter 'exit'. To return to the main menu, enter 'main menu'."
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
    puts "If you would like more information about this destination please enter 'yes'."
      self.destination_link(input_url, more_input)
    elsif more_input == "main menu"
        self.main_menu
    end
  end
  end


def destination_link(input_url, more_input)
  while more_input != "exit" && more_input != "main menu"
  if gets.chomp.downcase == 'yes'
    Destinations::TravelDestinations.scrape_for_link(input_url, more_input)
    puts "To exit the program, enter 'exit'. To return to the main menu, enter 'main menu'."
  else
    puts "To exit the program, enter 'exit'. To return to the main menu, enter 'main menu'."
    another_input = gets.chomp.downcase
    if another_input == "main menu"
      self.main_menu
    end
  end
end
end

end
