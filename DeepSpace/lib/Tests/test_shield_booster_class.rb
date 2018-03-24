require 'test/unit'

require 'ShieldBooster'

module Tests
    class TestShieldBoosterClass < Test::Unit::TestCase

      def setup
        @shield_booster=Deepspace::ShieldBooster.new("test", 1, 2)
      end

      def test_boost
        assert_respond_to @shield_booster, :boost, "No existe el getter :boost"
        assert_equal 1, @shield_booster.boost, "Fallo inicializando :boost"
      end

      def test_name
        assert_respond_to @shield_booster, :name, "No existe el getter :name"
        assert_equal "test", @shield_booster.name, "Fallo inicializando :name"
      end

      def test_uses
        assert_respond_to @shield_booster, :uses, "No existe el getter :uses"
        assert_equal 2, @shield_booster.uses, "Fallo inicializando :uses"
      end

      def test_new_copy
        assert Deepspace::ShieldBooster.respond_to? :newCopy
        copy=Deepspace::ShieldBooster.newCopy(@shield_booster)
        assert_equal @shield_booster.name, copy.name, "Error en :newCopy (attr: name)"
        assert_equal @shield_booster.boost, copy.boost, "Error en :newCopy (attr: boost)"
        assert_equal @shield_booster.uses, copy.uses, "Error en :newCopy (attr: uses)"
      end

      def test_get_ui_version
        assert_respond_to @shield_booster, :getUIversion, "No existe el metodo :getUIversion"
      end

      def test_to_s
        assert_respond_to @shield_booster, :to_s, "No existe el metodo :to_s"
      end

      def useIt
        assert_respond_to @shield_booster, :useIt, "No existe el metodo :useIt"
        assert_equal 1, @shield_booster.useIt, "Error en :useIt"
        assert_equal 1, @shield_booster.useIt, "Error en :useIt (Al intentar restar más de los debidos)"
      end

    end
end
