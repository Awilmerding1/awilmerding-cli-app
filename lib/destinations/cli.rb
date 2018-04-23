require 'pry'
class Destinations::CLI

  def call
    intro
    main_menu_select
  end

  def intro
    Destinations::TravelDestinationsLists.scrape_list
    Destinations::TravelDestinations.new_countries
    Destinations::TravelDestinations.new_cities
    Destinations::TravelDestinations.new_regions
    Destinations::TravelDestinations.new_value
    puts "\nWelcome! Please select one of the lists above by number.\n\n"
    puts "Type 'exit' to exit the program at anytime. Type 'main menu' to return to the list above at anytime."
  end

  def main_menu
    Destinations::TravelDestinationsLists.scrape_list
    puts "\nPlease select a list."
    self.main_menu_select
  end

  def main_menu_select
      input = gets.chomp
      list = nil
    if input.to_i == 1
      Destinations::TravelDestinationsLists.puts_countries
    elsif input.to_i == 2
      Destinations::TravelDestinationsLists.puts_cities
    elsif input.to_i == 3
      Destinations::TravelDestinationsLists.puts_regions
    elsif input.to_i == 4
      Destinations::TravelDestinationsLists.puts_value
    elsif input == "main menu"
      self.main_menu
    elsif input == "exit"
      abort("Bye!")
    end
    puts "\nIf you would like to read about one of these destinations, please enter it's number on the list.\n\n"
    self.destination_more_info(input.to_i)
  end

  def destination_more_info(input)
    more_input = gets.chomp
    destination = nil
    if more_input.to_i.between?(1,10)
      if input.to_i == 1
        destination = Destinations::TravelDestinations.find_country_destination(more_input.to_i)
        puts destination.summary
      elsif input.to_i == 2
        destination = Destinations::TravelDestinations.find_city_destination(more_input.to_i)
        puts destination.summary
      elsif input.to_i == 3
        destination = Destinations::TravelDestinations.find_region_destination(more_input.to_i)
        puts destination.summary
      elsif input.to_i == 4
        destination = Destinations::TravelDestinations.find_value_destination(more_input.to_i)
        puts destination.summary
      end
      puts "If you would like more information about this destination please enter 'yes'."
        self.destination_link(destination)
    else
      self.exit_or_menu
    end
  end


def destination_link(destination)
  answer = gets.chomp.downcase
  new_answer = nil
  if answer == 'yes'
      puts "\nPlease visit #{destination.link_url} for more information on #{destination.name}.\n\n"
    self.exit_or_menu
  else
    until new_answer == "main menu" || answer == "exit"
    self.exit_or_menu
  end
end
end

def exit_or_menu
  puts "To exit the program, enter 'exit'. To return to the main menu, enter 'main menu'."
  new_answer = gets.chomp.downcase
  if new_answer == "main menu"
    self.main_menu
  elsif new_answer == "exit"
      abort("Bye!")
  end
end


end
