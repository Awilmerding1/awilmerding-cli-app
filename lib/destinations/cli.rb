class Destinations::CLI

  def call
    intro
    main_menu_select
  end

  def intro
    Destinations::TravelDestinationsScraper.scrape_top_ten
    puts "\nWelcome! Please select one of the lists above by number or keyword.\n\n"
    puts "Type 'exit' to exit the program at anytime. Type 'main menu' to return to the list above at anytime."
  end

  def main_menu
    Destinations::TravelDestinationsScraper.scrape_top_ten
    puts "Please select a list."
    self.main_menu_select
  end

  def main_menu_select
      input = gets.chomp.downcase
      link = nil
    if input.to_i == 1 || input.include?("countries")
      Destinations::TravelDestinationsScraper.scrape_top_countries
      link = "https://www.lonelyplanet.com/best-in-travel/countries"
    elsif input.to_i == 2 || input.include?("cities")
      Destinations::TravelDestinationsScraper.scrape_top_cities
      link = "https://www.lonelyplanet.com/best-in-travel/cities"
    elsif input.to_i == 3 || input.include?("regions")
      Destinations::TravelDestinationsScraper.scrape_top_regions
      link = "https://www.lonelyplanet.com/best-in-travel/regions"
    elsif input.to_i == 4 || input.include?("value") || input.include?("best")
      Destinations::TravelDestinationsScraper.scrape_top_value
      link = "https://www.lonelyplanet.com/best-in-travel/value"
    elsif input == 'exit'
      abort("Bye!")
    elsif input == 'main menu'
      self.main_menu
    end
    puts "\nIf you would like to read about one of these destinations, please enter it's number on the list.\n\n"
    self.destination_more_info(link)
  end

  def destination_more_info(input_url)
    more_input = gets.chomp.downcase
    if more_input.to_i.between?(1,10)
    Destinations::TravelDestinations.scrape_for_description(input_url, more_input.to_i)
    puts "If you would like more information about this destination please enter 'yes'."
      self.destination_link(input_url, more_input)
    elsif more_input == "main menu"
      self.main_menu
    elsif more_input == "exit"
      abort("Bye!")
    end
  end


def destination_link(input_url, more_input)
  answer = gets.chomp.downcase
  new_answer = nil
  if answer == 'yes'
    Destinations::TravelDestinations.scrape_for_link(input_url, more_input)
  elsif answer == "main menu"
      self.main_menu
  elsif answer == "exit"
      abort("Bye!")
  else
    until new_answer == "main menu" || answer == "exit"
    puts "To exit the program, enter 'exit'. To return to the main menu, enter 'main menu'."
    new_answer = gets.chomp.downcase
    if new_answer == "main menu"
      self.main_menu
    elsif new_answer == "exit"
        abort("Bye!")
    end
  end
end
end


end
