require 'nokogiri'
require 'open-uri'


def trader_du_futur
  tab = []
  while 1         # boucle infini
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))  #je met cette ligne dans la boucle pour que la page 
    doc.css('a.currency-name-container').each_with_index do | monnaie, nb |                               #s'actualise
      tab[nb] = Hash.new(0)                                                 #je range un nvx hash dans chaque case de mon tableau
      tab[nb][:"#{monnaie.text}"] = doc.css('a.price')[nb].text
       #sleep 1          
      puts tab[nb]
    end
    p tab  #affichage du tableau entier 
    puts "chaque heure ce programme s'actualise, attendez un peu pour le prochain affichage"
    sleep (3600-1584) #on doit reafficher dans 1 heure; seulement comme je met une seconde entre chaque affichage , je soustrait le
  end                 #nombre de monnaie qu'il y a au nombre de seconde qu'il y a dans une heure. Comme ça l'affichage se lance
end                   #toute les heures


trader_du_futur

