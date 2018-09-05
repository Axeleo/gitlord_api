class HerosController < ApplicationController

  def create
    

  end

  def fetch_hero_exp

  end

  def create_hero_from_class(heroclass)
    if heroclass == "Hunter"
      Hunter.new
    elsif heroclass == "Warrior"
      Warrior.new
    elsif heroclass == "Mage"
      Mage.new
    else
      HeroBase.new
    end
  end
end
