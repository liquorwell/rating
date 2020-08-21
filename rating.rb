require './get_player_points.rb'
require './calcurate.rb'
require './read_and_write_player_rates.rb'


players, points = get_players_points()    #標準入力を受け付けてプレイヤーと点数の配列を作成
scores = points_to_scores(points)    #点数をスコアに変換
header, player_rates = make_player_rates()    #CSVファイルを読み込む
rates = make_rates(players, player_rates)    #読み込んだ結果からレートの配列を作成
rates, change_rates = rate_calcurate(rates, scores)    #レートとスコアを使ってレートの変動値と変動後の値を作成
update_player_rates(players, rates, player_rates, header)    #変動後の結果をCSVファイルに書き込み

#結果を表示する
(0..3).each do |n|
  puts "#{n+1}位　#{players[n]}　
    点数：#{points[n]}　
    スコア：#{scores[n]}　
    レート：#{rates[n]} (#{change_rates[n]})"
end
