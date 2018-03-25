require 'test/unit'

require 'Damage'
require 'Weapon'
require 'WeaponType'
require 'ShieldBooster'
require 'SuppliesPackage'
require 'SpaceStation'
require 'Hangar'

module Tests
    class TestSpaceStationClass < Test::Unit::TestCase

      def setup
        @shield=Deepspace::ShieldBooster.new("shield", 10, 20)
        @weapon=Deepspace::Weapon.new("weapon", Deepspace::WeaponType::MISSILE, 10)
        @supplies=Deepspace::SuppliesPackage.new(10, 99, 30)
        @supplies2=Deepspace::SuppliesPackage.new(10, 10, 10)
        @hangar=Deepspace::Hangar.new(100)
        @space_station=Deepspace::SpaceStation.new("test", @supplies)
      end

      def test_getters
        assert_respond_to @space_station, :ammoPower, "No existe el getter :ammoPower"
        assert_respond_to @space_station, :fuelUnits, "No existe el getter :fuelUnits"
        assert_respond_to @space_station, :hangar, "No existe el getter :hangar"
        assert_respond_to @space_station, :name, "No existe el getter :name"
        assert_respond_to @space_station, :nMedals, "No existe el getter :nMedals"
        assert_respond_to @space_station, :pendingDamage, "No existe el getter :pendingDamage"
        assert_respond_to @space_station, :shieldBoosters, "No existe el getter :shieldBoosters"
        assert_respond_to @space_station, :shieldPower, "No existe el getter :shieldPower"
        assert_respond_to @space_station, :speed, "No existe el getter :speed"
        assert_respond_to @space_station, :weapons, "No existe el getter :weapons"
      end

      def test_discard_hangar
        assert_respond_to @space_station, :discardHangar, "No existe el getter :discardHangar"
        assert_equal nil, @space_station.hangar, ":discardHangar no funciona"
      end

      def test_receive_hangar
        assert_respond_to @space_station, :receiveHangar, "No existe el getter :receiveHangar"
        @space_station.receiveHangar(@hangar)
        assert_equal @hangar, @space_station.hangar,":receiveHangar no funciona correctamente"
      end

      def test_move
        assert_respond_to @space_station, :move, "No existe el getter :move"
        @space_station.move
        assert_equal 98.01, @space_station.fuelUnits, "No se resta correctamente :move"
      end

      def test_receive_shield_booster
        assert_respond_to @space_station, :receiveShieldBooster, "No existe el getter :receiveShieldBooster"
        assert_equal false, @space_station.receiveShieldBooster(@shield), "No funciona en caso @hangar=nil"
        @space_station.receiveHangar(@hangar)
        @space_station.receiveShieldBooster(@shield)
        assert_equal [@shield], @space_station.hangar.shieldBoosters, "No funciona en caso @hangar!=nil"
      end

      def test_receive_weapon
        assert_equal false, @space_station.receiveWeapon(@weapon), "No funciona en caso @hangar=nil"
        assert_respond_to @space_station, :receiveWeapon, "No existe el getter :receiveWeapon"
        @space_station.receiveHangar(@hangar)
        @space_station.receiveWeapon(@weapon)
        assert_equal [@weapon], @space_station.hangar.weapons, "No funciona en caso @hangar!=nil"
      end

      def test_mount_shield_booster
        @hangar.addShieldBooster(@shield)
        @space_station.receiveHangar(@hangar)
        @space_station.mountShieldBooster(0)
        assert_equal @shield.name, @space_station.shieldBoosters[0].name, "Fallo en :mountShieldBooster"
        assert_equal @shield.uses, @space_station.shieldBoosters[0].uses, "Fallo en :mountShieldBooster"
        assert_equal @shield.boost, @space_station.shieldBoosters[0].boost, "Fallo en :mountShieldBooster"
      end

      def test_mount_weapon
        @hangar.addWeapon(@weapon)
        @space_station.receiveHangar(@hangar)
        @space_station.mountWeapon(0)
        assert_equal @weapon.name, @space_station.weapons[0].name, "Fallo en :mountWeapon"
        assert_equal @weapon.uses, @space_station.weapons[0].uses, "Fallo en :mountWeapon"
        assert_equal @weapon.type, @space_station.weapons[0].type, "Fallo en :mountWeapon"
      end

      def test_receive_supplies
        assert_respond_to @space_station, :receiveSupplies, "No existe el metodo :receiveSupplies"
        @space_station.receiveSupplies(@supplies2)
        assert_equal 20, @space_station.ammoPower, "Fallo en valor de @ammoPower"
        assert_equal 40, @space_station.shieldPower, "Fallo en valor de @shieldPower"
        assert_equal 100, @space_station.fuelUnits, "Fallo en valor de @fuelUnits"
      end

      def test_valid_state
        assert_respond_to @space_station, :validState, "No existe el metodo :validState"
        assert_equal true, @space_station.validState, "Fallo en :validState"
      end

      def test_set_pending_damage
        assert_respond_to @space_station, :setPendingDamage, "No existe el metodo :setPendingDamage"
      end

      def test_receive_shot
        assert_respond_to @space_station, :receiveShot, "No existe el getter :receiveShot"
      end

      def test_discard_shield_booster
        assert_respond_to @space_station, :discardShieldBooster, "No existe el getter :discardShieldBooster"
      end

      def test_discard_weapon
        assert_respond_to @space_station, :discardWeapon, "No existe el getter :discardWeapon"
      end

      def test_fire
        assert_respond_to @space_station, :fire, "No existe el getter :fire"
      end

      def test_protection
        assert_respond_to @space_station, :protection, "No existe el getter :protection"
      end

      def test_set_loot
        assert_respond_to @space_station, :setLoot, "No existe el getter :setLoot"
      end

      def test_get_ui_version
        assert_respond_to @space_station, :getUIversion, "No existe el getter :getUIversion"
      end

    end
end
