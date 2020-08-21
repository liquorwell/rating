require 'csv'

def make_player_rates()
  header, *player_rates = CSV.read('./player_rates.csv')
  player_rates.each do |player_rate|
    player_rate[1] = player_rate[1].to_i
    player_rate[2] = player_rate[2].to_i
  end
  return header, player_rates
end


def make_rates(players, player_rates)
  rates = []
  players.each do |player|
    player_rates.each do |player_rate|
      if player == player_rate[0]
        rates.push(player_rate[1])
      end
    end
  end
  return rates
end


def update_player_rates(players, rates, player_rates, header)
  #処理用の配列を作成
  mini_player_rates = []
  (0..3).each do |n|
    mini_player_rates.push([players[n], rates[n]])
  end

  #更新する前にプレイヤーレートのバックアップを残す
  player_rates.each do |player_rate|
    player_rate[2] = player_rate[1]
  end

  mini_player_rates.each do |mini_player_rate|
    player_rates.each do |player_rate|
      if mini_player_rate[0] == player_rate[0]
        player_rate[1] = mini_player_rate[1]
      end
    end
  end

  player_rates_csv = CSV.open('player_rates.csv','w')
  player_rates_csv.puts(header)
  player_rates.each do |player_rate|
    player_rates_csv.puts(player_rate)
  end
  player_rates_csv.close
end
