# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'test/unit'

require_relative 'Loot'
require_relative 'WeaponType'
require_relative 'SuppliesPackage'
require_relative 'ShieldBooster'
require_relative 'Weapon'
require_relative 'Dice'
require_relative 'GameCharacter'
module Deepspace
    class TestDeepSpace < Test::Unit::TestCase
      
      def test_loot
        @loot_object = Loot.new(1,2,3, 4, 5)
        assert_equal 1, @loot_object.nSupplies
        assert_equal 2, @loot_object.nWeapons
        assert_equal 3, @loot_object.nShields
        assert_equal 4, @loot_object.nHangars
        assert_equal 5, @loot_object.nMedals
        
        @loot_object.getUIversion
        @loot_object.to_s
        
      end
      
      def test_shield_booster
        @shield_booster_object = ShieldBooster.new("boom", 1, 3)
          assert_equal 1, @shield_booster_object.boost
          assert_equal 3, @shield_booster_object.uses
          @shield_booster_object.useIt
          assert_equal 2, @shield_booster_object.uses
          assert_equal 1, @shield_booster_object.useIt
      end
      
      def test_weapon_type
        assert_equal 2.0, WeaponType::LASER.power
        assert_equal 3.0, WeaponType::MISSILE.power
        assert_equal 4.0, WeaponType::PLASMA.power
      end
      
      def test_supplies_package
        @supplies_package_object = SuppliesPackage.new(1,2,3)
        assert_equal 1, @supplies_package_object.ammoPower
        assert_equal 2, @supplies_package_object.fuelUnits
        assert_equal 3, @supplies_package_object.shieldPower
        copy = @supplies_package_object.newCopy(@supplies_package_object)
        assert_equal 1, copy.ammoPower
        assert_equal 2, copy.fuelUnits
        assert_equal 3, copy.shieldPower
      end

      def test_weapon
        @weapon_object = Weapon.new("boom", WeaponType::PLASMA, 2)
        assert_equal "boom", @weapon_object.name
        assert_equal WeaponType::PLASMA, @weapon_object.type
        assert_equal 2, @weapon_object.uses
        copy = Weapon.newCopy(@weapon_object)
        assert_equal "boom", copy.name
        assert_equal WeaponType::PLASMA, copy.type
        assert_equal 2, copy.uses
        assert_equal WeaponType::PLASMA.power, copy.useIt
        copy.useIt
        assert_equal 1.0, copy.useIt
        
        @weapon_object.getUIversion
      end

       def test_dice
         @dice_object = Dice.new
         n = [0,0,0,0]
         
         for i in 1..1000
           if @dice_object.initWithNHangars == 0
             n[0]=n[0]+1.0
           end
           if @dice_object.initWithNWeapons == 1
             n[1]=n[1]+1.0
           end
           if @dice_object.initWithNShields == 0
             n[2]=n[2]+1.0
           end
           if @dice_object.firstShot == GameCharacter::SPACESTATION
             n[3]=n[3]+1.0
           end
         end
         
         p1=n[0]/1000.0
         p2=n[1]/1000.0
         p3=n[2]/1000.0
         p4=n[3]/1000.0
         
         assert 0.2 < p1 && p1 < 0.3, "Probabilidad no adecuada P1"
         assert 0.28 < p2 && p2 < 0.38, "Probabilidad no adecuada P2"
         assert 0.2 < p3 && p3 < 0.3, "Probabilidad no adecuada P3"
         assert 0.45 < p4 && p4 < 0.55, "Probabilidad no adecuada P4"
         
         #Probamos el método whoStarts.
         x = @dice_object.whoStarts(10)
         assert 0 <= x && x < 10, "Fallo en la eleccion de jugador (whoStarts)"
       end
      
    end
end
