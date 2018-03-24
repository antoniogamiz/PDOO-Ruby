require 'test/unit'

require 'Damage'
require 'Weapon'
require 'WeaponType'
require 'ShieldBooster'

module Tests
    class TestDamageClass < Test::Unit::TestCase

      def setup
        @s1=[Deepspace::ShieldBooster.new("a", 1, 2)]
        @s2=[Deepspace::ShieldBooster.new("a", 3, 4), Deepspace::ShieldBooster.new("c", 5, 6)]

        @w=Deepspace::Weapon.new("a", Deepspace::WeaponType::LASER, 10)
        # @w2=Deepspace::Weapon.new("b", Deepspace::WeaponType::MISSILE, 20)
        # @w3=Deepspace::Weapon.new("c", Deepspace::WeaponType::PLASMA, 30)

        @w1=Deepspace::WeaponType::LASER
        @w2=Deepspace::WeaponType::MISSILE
        @w3=Deepspace::WeaponType::PLASMA

        @wl1=[@w1, @w1, @w2, @w3, @w3]
        @wl2=[@w1, @w2, @w2, @w3]

        @damage_numeric1=Deepspace::Damage.newNumericWeapons(10, 10)
        @damage_numeric2=Deepspace::Damage.newNumericWeapons(12, 11)
        @damage_specific1=Deepspace::Damage.newSpecificWeapons(@wl1, 10)
        @damage_specific2=Deepspace::Damage.newSpecificWeapons(@wl2, 20)
      end

      def test_new_copy
        assert Deepspace::Damage.respond_to? :newCopy
        copy=Deepspace::Damage.newCopy(@damage_numeric1)
        assert_equal @damage_numeric1.nShields, copy.nShields, "Error en :newCopy (attr: nShields)"
        assert_equal @damage_numeric1.nWeapons, copy.nWeapons, "Error en :newCopy (attr: nWeapons)"
        assert_equal @damage_numeric1.weapons, copy.weapons, "Error en :newCopy (attr: weapons)"
      end

      def test_adjust
        assert_equal [@w1, @w2, @w3], @damage_specific1.adjust(@wl2, []).weapons, "Error en interseccion"
        assert_equal 0, @damage_specific1.adjust(@wl2, []).nShields, "Error en minimo"        
      end

      def test_discardWeapon
        assert_equal @damage_numeric1.nWeapons-1, @damage_numeric1.discardWeapon(1), "Error en :discardWeapon"
        @damage_specific2.discardWeapon(@w)
        assert_equal [@w2, @w2, @w3], @damage_specific2.weapons, "Error en :discardWeapon (specific)"
      end

      def test_discardShieldBooster
        assert_equal @damage_numeric1.nShields-1, @damage_numeric1.discardShieldBooster, "Error en :discardShieldBooster"
      end

      def test_get_ui_version
        assert_respond_to @damage_numeric1, :getUIversion, "No existe el metodo :getUIversion"
      end

      def test_to_s
        assert_respond_to @damage_numeric1, :to_s, "No existe el metodo :to_s"
      end

    end
end
