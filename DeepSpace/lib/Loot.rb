# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'LootToUI'

module Deepspace
  class Loot
    def initialize(nSupplies, nWeapons, nShields, nHangars, nMedals)
      @nSupplies=nSupplies
      @nWeapons=nWeapons
      @nShields=nShields
      @nHangars=nHangars
      @nMedals=nMedals
    end 
     
    attr_reader :nSupplies, :nWeapons, :nShields, :nHangars, :nMedals
    
    def getUIversion
      LootToUI.new(self)
    end
    
    def to_s
      "nSupplies: #{@nSupplies} nWeapons: #{@nWeapons} nShields: #{@nShields} nHangars: #{@nHangars} nMedals: #{@nMedals}" 
    end
  end
end
