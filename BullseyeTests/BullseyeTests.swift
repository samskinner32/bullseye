//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Sam Skinner on 6/8/22.
//

import XCTest
@testable import Bulls_Eye

class Bulls_EyeTests: XCTestCase {
  
  var game: Game!
  
  override func setUpWithError() throws {
    game = Game()
  }
  
  override func tearDownWithError() throws {
    game = nil
  }
  
  func testScorePositive() throws {
    let guess = game.targetValue + 5
    let score = game.getPointsFromValue(Double(guess))
    XCTAssertEqual(score, 95)
  }
  
  func testScoreNegative() throws {
    let guess = game.targetValue - 5
    let score = game.getPointsFromValue(Double(guess))
    XCTAssertEqual(score, 95)
  }
  
  func testScoreExact() throws {
    let guess = game.targetValue
    let score = game.getPointsFromValue(Double(guess))
    XCTAssertEqual(score, 100 + 100)
  }
  
  func testScoreClose() throws {
    let guess = game.targetValue - 1
    let score = game.getPointsFromValue(Double(guess))
    XCTAssertEqual(score, 99 + 50)
  }
  
  func testNewRound() throws {
    game.addPointsToScore(points: 100)
    game.startNewRound(points: 100)
    XCTAssertEqual(game.score, 100)
    XCTAssertEqual(game.roundNumber, 2)
  }
  
  func testRestart() throws {
    game.addPointsToScore(points: 100)
    game.startNewRound(points: 100)
    XCTAssertNotEqual(game.score, 0)
    XCTAssertNotEqual(game.roundNumber, 1)
    game.restart()
    XCTAssertEqual(game.score, 0)
    XCTAssertEqual(game.roundNumber, 1)
  }
  
  func testLeaderboard() throws {
    game.addPointsToScore(points: 100)
    game.startNewRound(points: 100)
    game.addPointsToScore(points: 100)
    game.startNewRound(points: 100)
    game.addPointsToScore(points: 100)
    game.startNewRound(points: 100)
    XCTAssertEqual(game.leaderboardEntries.count, 1)
    XCTAssertEqual(game.leaderboardEntries[0].score, 300)
    game.addPointsToScore(points: 200)
    game.startNewRound(points: 200)
    game.addPointsToScore(points: 200)
    game.startNewRound(points: 200)
    game.addPointsToScore(points: 200)
    game.startNewRound(points: 200)
    XCTAssertEqual(game.leaderboardEntries.count, 2)
    XCTAssertEqual(game.leaderboardEntries[0].score, 600)
    XCTAssertEqual(game.leaderboardEntries[1].score, 300)
  }
  
  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
