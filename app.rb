require 'httparty'
require 'json'

class RandomNames

  def initialize(number:, locale: nil)
    number > 500 ? amount = 500 : amount = number
    locale.nil? ? region = nil : region = locale

    if region.nil?
      @uri_str = URI.escape("https://uinames.com/api/?amount=#{amount}")
    else
      @uri_str = URI.escape("https://uinames.com/api/?amount=#{amount}&region=#{region}")
    end
  end

  def get_names
    response = HTTParty.get(@uri_str)
    names_hash = JSON.parse(response.body)

    puts names_hash
  end
end

random_names = RandomNames.new(number: 20, locale: "United States")
random_names.get_names
