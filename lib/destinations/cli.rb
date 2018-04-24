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
    elsif input.to_i == 5
      Destinations::TravelDestinationsLists.put_all
    else
      self.exit_or_menu
    end
    puts "\nIf you would like to read about one of these destinations, please enter it's number on the list.\n\n"
    self.destination_more_info(input)
  end

  def destination_more_info(input)
    more_input = gets.chomp.downcase
    destination = nil
    if more_input.to_i.between?(1,10)
      destination = Destinations::TravelDestinations.find_input_to_index(input, more_input)
      puts destination.summary
      puts "If you would like more information about this destination please enter 'more info'."
      self.destination_link(destination)
    elsif more_input == "main menu"
      self.main_menu
    elsif more_input == "exit"
      abort("Bye!")
    else
      self.exit_or_menu
    end
  end


def destination_link(destination)
  answer = gets.chomp.downcase
  if answer == 'more info'
      puts "\nPlease visit #{destination.link_url} for more information on #{destination.name}.\n\n"
    self.exit_or_menu
  elsif answer == "main menu"
    self.main_menu
  elsif answer == "exit"
    abort("Bye!")
  else
    self.exit_or_menu
end
end

def exit_or_menu
  puts "To exit the program, enter 'exit'. To return to the main menu, enter 'main menu'."
  new_answer = gets.chomp.downcase
  if new_answer == "main menu"
    self.main_menu
  elsif new_answer == "exit"
      abort("Bye!")
  else
    puts "To exit the program, enter 'exit'. To return to the main menu, enter 'main menu'."
    self.exit_or_menu
  end
end


end
