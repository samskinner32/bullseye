//
//  Game.swift
//  Bullseye
//
//  Created by Sam Skinner on 6/8/22.
//

import Foundation

struct LeaderboardEntry {
  let score: Int
  let date: Date
}

struct Game {
  var targetValue: Int = Int.random(in: 1...100)
  var score: Int = 0
  var roundNumber: Int = 1
  var leaderboardEntries: [LeaderboardEntry] = []
  
  func getPointsFromValue(_ sliderValue: Double) -> Int {
    let roundedValue: Int = Int(sliderValue.rounded())
    var pointsEarned = max(0, 100 - abs(targetValue - roundedValue))
    if pointsEarned == 100 {
      pointsEarned += 100
    }
    if pointsEarned == 99 {
      pointsEarned += 50
    }
    return pointsEarned
  }
  
  mutating func addPointsToScore(points: Int) {
    score += points
  }
  
  mutating func startNewRound(points: Int) {
    if (roundNumber == 3) {
      addToLeaderboard(score)
      restart()
    } else {
      roundNumber += 1
      targetValue = Int.random(in: 1...100)
    }
  }
  
  mutating func restart() {
    score = 0
    roundNumber = 1
    targetValue = Int.random(in: 1...100)
  }
  
  mutating func addToLeaderboard(_ points: Int) {
    leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
    leaderboardEntries.sort { $0.score > $1.score }
  }
}
