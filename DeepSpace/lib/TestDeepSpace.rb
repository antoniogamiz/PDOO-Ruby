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
require_relative 'ShotResult'
require_relative 'Hangar'
require_relative 'Damage'
require_relative 'EnemyStarShip'

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

        @shield_booster_object.getUIversion
        @shield_booster_object.to_s
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
        copy = SuppliesPackage.newCopy(@supplies_package_object)
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
        @weapon_object.to_s
      end

       def test_dice
         @dice_object = Dice.new
         @dice_object.to_s
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

       def test_hangar
         @hangar=Hangar.new(10)
         w1 = Weapon.new("boom1", WeaponType::PLASMA, 2)
         w2 = Weapon.new("boom2", WeaponType::PLASMA, 2)
         s1 = ShieldBooster.new("pam1", 1, 3)
         s2 = ShieldBooster.new("pam2", 1, 3)

         assert !@hangar.removeShieldBooster(3), "Fallo al eliminar elemento"
         assert !@hangar.removeWeapon(4), "Fallo al eliminar elemento"

         assert @hangar.addWeapon(w1)
         assert @hangar.addShieldBooster(s1)

         assert_kind_of(Weapon, @hangar.removeWeapon(0))
         assert_kind_of(ShieldBooster, @hangar.removeShieldBooster(0))
         assert_kind_of(Array, @hangar.weapons)
         assert_kind_of(Array, @hangar.shieldBoosters)

         @hangar.getUIversion

         assert 10 == @hangar.maxElements
       end

      def test_damage
        w1 = Deepspace::Weapon.new("weapon", Deepspace::WeaponType::LASER, 0)
        w2 = Deepspace::Weapon.new("weapon2", Deepspace::WeaponType::MISSILE, 1)
        w3 = Deepspace::Weapon.new("weapon3", Deepspace::WeaponType::PLASMA, 3)
        w4 = Deepspace::Weapon.new("weapon4", Deepspace::WeaponType::LASER, 2)

        s1 = Deepspace::ShieldBooster.new("shield1", 5, 6)
        s2 = Deepspace::ShieldBooster.new("shield2", 3, 0)

        @d1 = Deepspace::Damage.newNumericWeapons(2,3)

        ws2=[Deepspace::WeaponType::LASER, Deepspace::WeaponType::LASER]

        @d2 = Deepspace::Damage.newSpecificWeapons(ws2, 1)

        ws1=[w1, w2, w3, w4]
        ss1=[s1, s1]

        adj1=@d1.adjust(ws1, ss1)
        assert (adj1.nWeapons == 2 && adj1.nShields == 2), "Weapons: #{adj1.nWeapons} #{adj1.nShields}"

        adj2 = @d2.adjust(ws1, ss1)
        assert [Deepspace::WeaponType::LASER,Deepspace::WeaponType::LASER] == adj2.weapons, "Weapons: #{adj2.weapons}"

        adj2.discardWeapon(w1)
        assert [] == adj2.weapons, "#{adj2.weapons}"
        assert 0 == adj2.discardShieldBooster, "#{adj2.nShields}"
        assert false == adj2.hasNoEffect

        assert 1 == adj1.discardWeapon(w1)

        adj1.getUIversion
      end

      def test_enemy_start_ship
        e1 = Deepspace::EnemyStarShip.new(5,"Flota imperial",4, Deepspace::Loot.new(1,2,3,4,5), @d1)
        e2 = Deepspace::EnemyStarShip.new(5,"Enemigo",1, Deepspace::Loot.new(1,2,3,4,5), @d2)

        assert Deepspace::ShotResult::RESIST==e1.receiveShot(2), "#{e1.receiveShot(2)}"

      end
    end
end
