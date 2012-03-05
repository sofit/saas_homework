class WrongNumberOfPlayersError < StandardError ; end

class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  player1 = game[0]
  player2 = game[1]
  if player1[1] == nil || player2[1] == nil
    raise NoSuchStrategyError
  end
  player1[1] = player1[1].upcase
  player2[1] = player2[1].upcase
  stategies = ['S', 'R', 'P']
  if stategies.include?(player1[1]) == false || stategies.include?(player2[1]) == false
    raise NoSuchStrategyError
  elsif player1[1] == player2[1]
  return player1
  elsif player1[1] == 'R' && player2[1] == 'S' ||
  player1[1] == 'S' && player2[1] == 'P' ||
  player1[1] == 'P' && player2[1] == 'R'
  return player1
  elsif player2[1] == 'R' && player1[1] == 'S' ||
  player2[1] == 'S' && player1[1] == 'P' ||
  player2[1] == 'P' && player1[1] == 'R'
  return player2
  end
end

def rps_tournament_winner(game, tour_result = nil, first = true)
  if first
    tour_result = Array.new();
  end
  game.each_with_index do |tournament, j|
    if game.length > 2 || tournament.kind_of?(Array) && tournament[0].kind_of?(Array) && tournament[0][0].kind_of?(Array)
      tour_result << Array.new(2)
      rps_tournament_winner(tournament, tour_result, false)
    else
      if (tour_result == nil || tour_result.length == 0)
        tour_result << Array.new(2)
      end
      tour_result[tour_result.length - 1][j] = rps_game_winner(tournament)
    end
  end
  if first
    if (tour_result.length == 1)
      rps_game_winner(tour_result[0])
    else
      rps_tournament_winner(tour_result)
    end
  end
end