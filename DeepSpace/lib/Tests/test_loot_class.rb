require 'test/unit'

require 'Loot'

module Tests
    class TestLootClass < Test::Unit::TestCase

      def setup
        @loot=Deepspace::Loot.new(1,2,3,4,5)
      end

      def test_nSupplies
        assert_respond_to @loot, :nSupplies, "No existe el getter :nSupplies"
        assert_equal 1, @loot.nSupplies, "Fallo inicializando :nSupplies"
      end

      def test_nWeapons
        assert_respond_to @loot, :nWeapons, "No existe el getter :nWeapons"
        assert_equal 2, @loot.nWeapons, "Fallo inicializando :nWeapons"
      end

      def test_nShields
        assert_respond_to @loot, :nShields, "No existe el getter :nShields"
        assert_equal 3, @loot.nShields, "Fallo inicializando :nShields"
      end

      def test_nHangars
        assert_respond_to @loot, :nHangars, "No existe el getter :nHangars"
        assert_equal 4, @loot.nHangars, "Fallo inicializando :nHangars"
      end

      def test_nMedals
        assert_respond_to @loot, :nMedals, "No existe el getter :nMedals"
        assert_equal 5, @loot.nMedals, "Fallo inicializando :nMedals"
      end

      def test_get_ui_version
        assert_respond_to @loot, :getUIversion, "No existe el metodo :getUIversion"
      end

      def test_to_s
        assert_respond_to @loot, :to_s, "No existe el metodo :to_s"
      end

    end
end
