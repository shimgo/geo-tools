require 'open-uri'
require "json"

addresses = [
  '東京都千代田区1-1-1',
  '東京都千代田区1-1-2',
]

GOOGLE_API_KEY = ENV['GOOGLE_API_KEY']
GOOGLE_MAPS_GEOCODING_ENDPOINT = 'https://maps.googleapis.com/maps/api/geocode/json'

def geocoding(address)
  query = URI.encode_www_form({address: address, key: GOOGLE_API_KEY, language: 'ja'})
  uri = URI.parse(GOOGLE_MAPS_GEOCODING_ENDPOINT + '?' + query)
  begin
    res = JSON.parse(uri.read)
    if res['status'] == 'OK'
      is_accurate = res['results'][0]['geometry']['location_type'] == 'ROOFTOP'
      addr = ''
      before_types = nil
      before_digits_only = false
      res['results'][0]['address_components'].reverse.each do |c|
        types = c['types']
        next if types.include?('postal_code') || types.include?('country')
        name = c['long_name']
        current_digits_only = name=~/^\p{Digit}+$/
        if before_digits_only
          addr += current_digits_only ? '-' : ' '
        elsif before_types && before_types.include?('sublocality') && types.include?('premise') && !current_digits_only
          addr += ' '
        end
        before_digits_only = current_digits_only
        addr += name
        before_types = types
      end

      loc = res['results'][0]['geometry']['location']
      lat = loc['lat']
      lng = loc['lng']
      puts "#{lat}\t#{lng}\t#{addr}"
    elsif res['status'] == 'ZERO_RESULTS'
      puts res['status']
    end
    sleep(1) # コール制限のため
  rescue OpenURI::HTTPError => e
    puts 'error'
  end
end

addresses.each do |a|
  geocoding(a)
end
