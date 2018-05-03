# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'LootToUI'

module Deepspace
  class Loot
    def initialize(nSupplies, nWeapons, nShields, nHangars, nMedals, ef=false, city=false)
      @nSupplies=nSupplies
      @nWeapons=nWeapons
      @nShields=nShields
      @nHangars=nHangars
      @nMedals=nMedals
      @efficient=ef
      @spaceCity=city
    end 
     
    attr_reader :nSupplies, :nWeapons, :nShields, :nHangars, :nMedals, :efficient, :spaceCity
    
    def getUIversion
      LootToUI.new(self)
    end
    
    def to_s
      "nSupplies: #{@nSupplies} nWeapons: #{@nWeapons} nShields: #{@nShields} nHangars: #{@nHangars} nMedals: #{@nMedals} Efficient: #{@efficient} SpaceCity #{@spaceCity}"  
    end
  end
end
