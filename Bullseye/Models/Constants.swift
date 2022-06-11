//
//  Models.swift
//  Bullseye
//
//  Created by Sam Skinner on 6/10/22.
//

import Foundation
import UIKit

enum Constants {
  enum General {
    public static let strokeWidth: CGFloat = CGFloat(2.0)
    public static let roundedViewLength: CGFloat = CGFloat(56.0)
    public static let roundRectViewWidth: CGFloat = CGFloat(68.0)
    public static let roundRectViewHeight: CGFloat = CGFloat(56.0)
    public static let roundRectCornerRadius: CGFloat = CGFloat(21.0)
  }
  enum Game {
    public static let startingSliderValue: CGFloat = CGFloat(50.0)
  }
  enum Leaderboard {
    public static let leaderboardScoreColWidth: CGFloat = CGFloat(50.0)
    public static let leaderboardDateColWidth: CGFloat = CGFloat(170.0)
    public static let leaderboardMaxRowWidth: CGFloat = CGFloat(480.0)
  }
}
