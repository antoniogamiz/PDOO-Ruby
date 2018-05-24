# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module TestP4

require_relative 'GameUniverse'
require_relative 'CombatResult'
class TestP4
  def initialize
   
  end
end

  puts "Programa de Pruebas para P4"
  game = Deepspace::GameUniverse.new();
  
  game.init(["Pruebas1", "Pruebas2"])
  
  #Comentar lina 49 de CardDeck
  
  puts "Luchndo con emey0"
  result=game.combat
  puts "Resultado de la batalla: #{result}"
  
  gameToUI=game.getUIversion
  puts gameToUI.currentStation.to_s

  game.nextTurn

end