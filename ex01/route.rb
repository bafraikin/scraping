require 'nokogiri'
require 'open-uri'


def get_the_email_of_a_townhal_from_its_webpage(temporaire, tab, nb)
  puts temporaire.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text   # affichage de chaque email trouvé
  tab[nb][:"email"] = temporaire.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text  #stockage dans le tableau
end

def get_all_the_urls_of_val_doise_townhalls(liens)
tab = []                                  #creation du tableau
  doc = Nokogiri::HTML(open(liens))
  size = doc.css("a.lientxt").length          #determiner l'etendu de ma boucle for
  puts "\n\nD'abord les emails !!! \n\n"
  sleep 1 #affichage propre
  for n in 0...size
    tab[n]= Hash.new(0)  #initialisation de chaque case avec un nouveau hash
    tmp = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com#{doc.css("a.lientxt")[n]['href']}")) #ouvre chaque pages des mairies
    tab[n][:"name"] = doc.css("a.lientxt")[n]['href'].tr("/95/", "").gsub(".html", "").tr(".", "").to_s #construction des noms des mairies
    get_the_email_of_a_townhal_from_its_webpage(tmp,tab, n)   #appel de la fonction                   # à partir due l'url recuperé
  end
  puts "\n\nPuis le beau tableau !! \n\n" #affichage propre
  sleep 2
  puts tab
end


url = "http://www.annuaire-des-mairies.com/val-d-oise.html"
get_all_the_urls_of_val_doise_townhalls(url) 
