def get_players_points()
  players = []
  points = []

  puts "\n麻雀レーティングプログラムを起動しました。\n\n"
  (1..4).each do |n|
    print "#{n}位のプレイヤー名を入力してください： "
    player = gets.chomp
    print "#{n}位の点数を入力してください： "
    point = gets.chomp.to_i
    print "#{n}位は#{player}, 点数は#{point}点です。\n\n"
    players.push(player)
    points.push(point)
  end
  return players, points
end
