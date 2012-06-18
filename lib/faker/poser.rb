require 'httparty'
require 'json'
module Faker
  # Thanks to Hipster Ipsum
  class Poser < Lorem
    def self.words(num = 3, type = "hipster-centric")
      hipster = HTTParty.get("http://hipsterjesus.com/api/?html=false&type=#{type}")
      hipster_array = JSON.parse(hipster.body)["text"].downcase.gsub(/\.|,/, "").split(" ")
      hipster_array.shuffle[0, num]
    end
  end
end
