require 'open-uri'
class Destinations::TravelDestinations

  attr_accessor :name, :summary, :list_number, :link_url, :list

  @@all = []

  def initialize(name, list_number, list)
    @name = name
    @list_number = list_number
    @list = list
    @@all << self
  end


  def doc
    self.doc ||= Nokogiri::HTML(open(self.list_url))
  end

  def summary
    self.summary ||= doc.css("##{self.list_number} .marketing-article__content").text
  end

  def link_url
    self.link_url ||= doc.css("##{self.list_number} .marketing-article__content a")["href"]
  end

  def self.all
    @@all
  end



end
