class HerosController < ApplicationController

  def create(hero_params)
    hero = create_hero_from_class(hero_params[:heroclass])
    hero.name = hero_params[:name]
    hero.save  
  end

  def test
    json_response(fetch_hero_exp())
  end

  CreateHeroExpQuery = GitHub::Client.parse <<-'GRAPHQL'
    # query($owner: owner, $name: name) {
	repository(owner: "Axeleo", name: "social_fretwork") {
		pullRequests(last:100, states:MERGED) {
      nodes {
        participants(first:10) {
          nodes {
            login
          }
        }
        additions
        deletions
      }
    }
  }
}
GRAPHQL


  def fetch_hero_exp
    data = query CreateHeroExpQuery
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
