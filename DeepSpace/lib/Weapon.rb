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
      
      attr_reader :name, :type, :uses
      
      def power
        @type.power
      end
      
      def useIt
        if @uses > 0
          @uses-=1
          power
        else
          1.0
        end
        
      end
      
      def getUIversion
        WeaponToUI.new(self)
      end
      
      def to_s
        "Name: #{@name} Type(power): #{@type.power} Uses: #{@uses}"
      end

    end
end
