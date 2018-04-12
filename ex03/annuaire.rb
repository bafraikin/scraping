require 'nokogiri'
require 'open-uri'



def annuaire_incroyable

  doc = Nokogiri::HTML(open('http://www.mon-incubateur.com/site_incubateur/incubateurs'))
  puts doc.css('.block_tw p')[0].text


end



annuaire_incroyable
