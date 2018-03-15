# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'WeaponToUI'

module Deepspace
    class Weapon
      def initialize(name, type, uses)
        @name=name
        @type=type
        @uses=uses
      end
      
      def self.newCopy(w)
        new(w.name, w.type, w.uses)
      end
      
      attr_reader :name
      attr_reader :type
      attr_reader :uses
      
      def power
        @type.power
      end
      
      def useIt
        if @uses > 0
          @uses-=1
          return power
        else
          return 1.0
        end
        
      end
      
      def getUIversion()
        WeaponToUI.new(self)
      end
      
    end
end
