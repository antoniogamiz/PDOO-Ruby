# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Deepspace
  class Loot
    def initialize(nSupplies, nWeapons, nHangars, nMedals)
      @nSupplies=nSupplies
      @nWeapons=nWeapons
      @nHangars=nHangars
      @nMedals=nMedals
    end 
     
    attr_reader :nSupplies
    attr_reader :nWeapons
    attr_reader :nHangars
    attr_reader :nMedals
    
  end
end
