require "./task2"
require "test/unit"
 
class TestTask2 < Test::Unit::TestCase
 
  def test_simple
    # assert_equal("[\"Dave\", \"S\"] wins since S>P", rps_game_winner([ [ "Armando", "P" ], [ "Dave", "S" ] ]))
    # assert_equal("[\"Dave\", \"S\"] wins since S>P", rps_game_winner([ [ "Armando", "p" ], [ "Dave", "s" ] ]))
    # assert_equal("[\"Armando\", \"P\"] wins since P>P", rps_game_winner([ [ "Armando", "P" ], [ "Dave", "P" ] ]))
    # assert_equal("[\"Armando\", \"P\"] wins since P>P", rps_game_winner([ [ "Armando", "p" ], [ "Dave", "p" ] ]))
    # assert_equal("[\"Armando\", \"R\"] wins since R>S", rps_game_winner([ [ "Armando", "R" ], [ "Dave", "S" ] ]))
    # assert_equal("[\"Armando\", \"R\"] wins since R>S", rps_game_winner([ [ "Armando", "r" ], [ "Dave", "s" ] ]))
    # assert_equal("[\"Armando\", \"S\"] wins since S>P", rps_game_winner([ [ "Armando", "S" ], [ "Dave", "P" ] ]))
    # assert_equal("[\"Armando\", \"S\"] wins since S>P", rps_game_winner([ [ "Armando", "s" ], [ "Dave", "p" ] ]))
    # assert_equal("[\"Armando\", \"P\"] wins since P>R", rps_game_winner([ [ "Armando", "P" ], [ "Dave", "R" ] ]))
    # assert_equal("[\"Armando\", \"P\"] wins since P>R", rps_game_winner([ [ "Armando", "p" ], [ "Dave", "r" ] ]))
#     
    assert_equal(["Dave", "S"], rps_game_winner([ [ "Armando", "P" ], [ "Dave", "S" ] ]))
    assert_equal(["Dave", "S"], rps_game_winner([ [ "Armando", "p" ], [ "Dave", "s" ] ]))
    assert_equal(["Armando", "P"], rps_game_winner([ [ "Armando", "P" ], [ "Dave", "P" ] ]))
    assert_equal(["Armando", "P"], rps_game_winner([ [ "Armando", "p" ], [ "Dave", "p" ] ]))
    assert_equal(["Armando", "R"], rps_game_winner([ [ "Armando", "R" ], [ "Dave", "S" ] ]))
    assert_equal(["Armando", "R"], rps_game_winner([ [ "Armando", "r" ], [ "Dave", "s" ] ]))
    assert_equal(["Armando", "S"], rps_game_winner([ [ "Armando", "S" ], [ "Dave", "P" ] ]))
    assert_equal(["Armando", "S"], rps_game_winner([ [ "Armando", "s" ], [ "Dave", "p" ] ]))
    assert_equal(["Armando", "P"], rps_game_winner([ [ "Armando", "P" ], [ "Dave", "R" ] ]))
    assert_equal(["Armando", "P"], rps_game_winner([ [ "Armando", "p" ], [ "Dave", "r" ] ]))
    assert_equal(["Richard", "R"], rps_tournament_winner(
    [
      [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"], ["Michael", "S"] ],
      ],
      [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
      ]
    ]
    ))
  end
 
  def test_failure
    assert_raise( NoMethodError ) { rps_game_winner(nil) }
    assert_raise( ArgumentError ) { rps_game_winner() }
    assert_raise( WrongNumberOfPlayersError ) { rps_game_winner([ [ "Armando", "P" ] ]) }
    assert_raise( WrongNumberOfPlayersError ) { rps_game_winner([ [ "Armando", "p" ] ]) }
    assert_raise( WrongNumberOfPlayersError ) { rps_game_winner([ [ "Armando", "P" ], [ "Armando", "P" ], [ "Armando", "P" ] ]) }
    assert_raise( WrongNumberOfPlayersError ) { rps_game_winner([ [ "Armando", "p" ], [ "Armando", "p" ], [ "Armando", "p" ] ]) }
    assert_raise( WrongNumberOfPlayersError ) { rps_game_winner([ [ "Armando"], [ "Armando"], [ "Armando"] ]) }
    assert_raise( WrongNumberOfPlayersError ) { rps_game_winner({}) }
    assert_raise( WrongNumberOfPlayersError ) { rps_game_winner([1, 2, 3]) }
    assert_raise( NoSuchStrategyError ) { rps_game_winner([ [ "Armando", "A" ], [ "Dave", "S" ] ]) }
    assert_raise( NoSuchStrategyError ) { rps_game_winner([ [ "Armando", "S" ], [ "Dave", "A" ] ]) }
    assert_raise( NoSuchStrategyError ) { rps_game_winner([ [ "Armando", "A" ], [ "Dave", "A" ] ]) }
  end
 
end

