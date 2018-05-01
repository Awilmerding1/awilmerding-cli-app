require 'pry'
class Destinations::CLI

  def call
    intro
    main_menu_select
  end

  def intro
    Destinations::TravelDestinationScraper.scraped_list.each_with_index do |list, index|
      puts "#{index+1}. #{list.text}"
    end
    puts "5. List of All Destinations"
    Destinations::TravelDestination.new_countries
    Destinations::TravelDestination.new_cities
    Destinations::TravelDestination.new_regions
    Destinations::TravelDestination.new_value
    puts "\nWelcome! Please select one of the lists above by number.\n\n"
    puts "Type 'exit' to exit the program at anytime. Type 'main menu' to return to the list above at anytime."
  end

  def main_menu
    Destinations::TravelDestinationScraper.scraped_list.each_with_index do |list, index|
      puts "#{index+1}. #{list.text}"
    end
    puts "5. List of All Destinations"
    puts "\nPlease select a list."
    self.main_menu_select
  end

  def main_menu_select
    input = gets.chomp
    list = nil
    if input.to_i == 1
      Destinations::TravelDestination.all_countries.each_with_index do |country, index|
        puts "#{index+1}. #{country.name}"
      end
    elsif input.to_i == 2
      Destinations::TravelDestination.all_cities.each_with_index do |city, index|
        puts "#{index+1}. #{city.name}"
      end
    elsif input.to_i == 3
      Destinations::TravelDestination.all_regions.each_with_index do |region, index|
        puts "#{index+1}. #{region.name}"
      end
    elsif input.to_i == 4
      Destinations::TravelDestination.all_value.each_with_index do |value, index|
        puts "#{index+1}. #{value.name}"
      end
    elsif input.to_i == 5
      Destinations::TravelDestination.all.each_with_index do |destination, index|
        puts "#{index+1}. #{destination.name}"
      end
    elsif input.downcase == "exit" || input.downcase == "main menu"
      self.exit_or_menu(input)
    else
      puts "Please enter a valid number, 'main menu' or 'exit'."
      self.main_menu_select
    end
    puts "\nIf you would like to read about one of these destinations, please enter it's number on the list.\n\n"
    self.destination_more_info(input)
  end

  def destination_more_info(input)
    more_input = gets.chomp.downcase
    destination = nil
    if input.to_i.between?(1,4)
      if more_input.to_i.between?(1,10)
        destination = Destinations::TravelDestination.find_input_to_index(input, more_input)
        puts destination.summary
        puts "If you would like more information about this destination please enter 'more info'."
        self.destination_link(destination)
      elsif more_input.downcase == "exit" || more_input.downcase == "main menu"
        self.exit_or_menu(more_input)
      else
        puts "Please enter a valid number, 'main menu' or 'exit'."
        self.destination_more_info(input)
      end
    elsif input.to_i == 5
      if more_input.to_i.between?(1,40)
        destination = Destinations::TravelDestination.all[more_input.to_i-1]
        puts destination.summary
        puts "If you would like more information about this destination please enter 'more info'."
        self.destination_link(destination)
      elsif more_input.downcase == "exit" || more_input.downcase == "main menu"
        self.exit_or_menu(more_input)
      else
        puts "Please enter a valid number, 'main menu' or 'exit'."
        self.destination_more_info(input)
      end
    else
      self.exit_or_menu(more_input)
    end
  end


def destination_link(destination)
  answer = gets.chomp.downcase
  if answer == 'more info'
    puts "\nPlease visit #{destination.link_url} for more information on #{destination.name}.\n\n"
    puts "To exit the program, enter 'exit'. To return to the main menu, enter 'main menu'."
    new_input = gets.chomp.downcase
    self.exit_or_menu(new_input)
  elsif answer == "exit" || answer == "main menu"
    self.exit_or_menu(answer)
  else
    puts "Please enter 'more info', 'main menu' or 'exit'."
    self.destination_link(destination)
  end
end

def exit_or_menu(new_answer)
  if new_answer == "main menu"
    self.main_menu
  elsif new_answer == "exit"
    abort("Bye!")
  else
    puts "To exit the program, enter 'exit'. To return to the main menu, enter 'main menu'."
    more_answer = gets.chomp.downcase
    self.exit_or_menu(more_answer)
  end
end


end
