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
     
    def nSupplies
      @nSupplies
    end

    def nWeapons
      @nWeapons
    end
    
    def nHangars
      @nHangars
    end     
    
    def nMedals
      @nMedals
    end   

    end
end
