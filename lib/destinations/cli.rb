class Destinations::CLI

  def call
    Destinations::TravelDestinations.scrape_top_ten
    intro
  end

  def intro
    puts "Welcome! Please select one of the lists above by number or keyword."
    puts "Type 'exit' to exit the program."
  end

end
