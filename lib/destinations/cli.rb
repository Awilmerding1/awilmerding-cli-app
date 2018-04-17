class Destinations::CLI

  def call
    Destinations::TravelDestinations.scrape_top_ten
    intro
    Destinations::TravelDestinations.scrape_top_countries
  end

  def intro
    puts "Welcome! Please select one of the lists above by number or keyword."
    puts "Type 'exit' to exit the program."
  end

  def main_menu_select
    input = gets.chomp.downcase
    if input.to_i > 4 || input.to_i < 1
      puts "Please enter a number on the list."
  end
end

end
