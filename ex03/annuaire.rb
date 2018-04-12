require 'nokogiri'
require 'open-uri'



def annuaire_incroyable
  tab = []
  index = 0
  for n in 1..37
    page = Nokogiri::HTML(open("http://www.alloweb.org/annuaire-startups/annuaire-incubateurs-startups/page/#{n}/"))
    for nb in 0...page.css("a.listing-row-image-link").size
      tab[index] = Hash.new(0)
      link =  Nokogiri::HTML(open(page.css("a.listing-row-image-link")[nb]['href']))
      tab[index][:name] = link.css('title').text.split(':')[0].split('-')[0] 
      indx_createur = link.css('title').text.split(':')[0].split('-').size
      tab[index][:createur] = link.css('title').text.split(':')[0].split('-')[indx_createur - 1]
     # indx_href = link.css('.wbp_wrapper p').size - 1
      link.xpath("/html/body/div[1]/div[3]/div/div/div[2]/div[1]/div/div/div/div[1]/div/div[1]/div/div/div/div/div/p[5]/a[1]").map do |lnk| 
      tab[index][:liens] = lnk['href']
      end


      puts tab[index]
      index +=1
    end
  end
end



annuaire_incroyable
