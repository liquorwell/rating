def points_to_scores(points)
  scores = []
  uma = [10, 5, -5, -10]    #ウマを変えたいときはここを変更　5-10
  oka = [25000, 30000]    #オカを変えたいときはここを変更　25000点持ち30000点返し

  (0..3).each do |n|
    score = ((points[n] - oka[1]) + uma[n] * 1000)
    scores.push(score)
  end

  scores[0] += (4 * (oka[1] - oka[0]))    #1位にオカを加算
  scores = scores.map{ |x| x / 1000.to_f }
  return scores
end


def rate_calcurate(rates, scores)
  change_rates = []
  average_rate = rates.sum.fdiv(rates.length)
  (0..3).each do |n|
    change_rates[n] = (0.24 * (scores[n] + ((average_rate - rates[n]) / 40))).round
    rates[n] += change_rates[n]
  end
  return rates, change_rates
end
