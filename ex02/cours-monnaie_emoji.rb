require 'nokogiri'
require 'open-uri'

def trader_du_lundi_with_emoji
tab = []

while 1         # boucle infini
l_amour_qui_parle = true 

doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))  #je met cette ligne dans la boucle pour que la page 
doc.css('a.currency-name-container').each_with_index do | monnaie, nb |  #s'actualise
  tab[nb] = Hash.new(0)   # je range un nvx hash dans chaque case de mon tableau
  tab[nb][monnaie.text] = doc.css('a.price')[nb].text
    if monnaie.text == "Ethereum"  && l_amour_qui_parle
    tab[nb]["🔥🦄🔥"] = "🔥🦄bae🔥🦄"
    l_amour_qui_parle = false
    end
   sleep 1   #sleep pour un meilleur confort d'affichage
  puts tab[nb]
end
p tab #affichage du tableau entier
puts "chaque heure ce programme s'actualise, attendez un peu pour le prochain affichage"
sleep (3600-1584)   #on doit reafficher dans 1 heure; seulement comme je met une seconde entre chaque affichage , je soustrait le
end                 #nombre de monnaie qu'il y a au nombre de seconde qu'il y a dans une heure. Comme ça l'affichage se lance
                    #toutes les heures
end



trader_du_lundi_with_emoji
