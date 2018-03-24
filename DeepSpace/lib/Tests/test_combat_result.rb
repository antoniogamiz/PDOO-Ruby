require 'test/unit'

require 'CombatResult'

module Tests
    class TestCombatResult < Test::Unit::TestCase
      def test_enum_correct
        assert !Deepspace::CombatResult::ENEMYWINS.nil?, "ENEMYWINS no definido"
        assert !Deepspace::CombatResult::NOCOMBAT.nil?, "NOCOMBAT no definido"
        assert !Deepspace::CombatResult::STATIONESCAPES.nil?, "STATIONESCAPES no definido"
        assert !Deepspace::CombatResult::STATIONWINS.nil?, "STATIONWINS no definido"
      end
    end
end
