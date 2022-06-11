//
//  TextViews.swift
//  Bullseye
//
//  Created by Sam Skinner on 6/8/22.
//

import SwiftUI

struct InstructionText: View {
  var text: String
  
  init(_ text: String) {
    self.text = text
  }
  
  var body: some View {
    Text(text)
      .font(.footnote)
      .bold()
      .foregroundColor(Color("TextColor"))
      .kerning(1.5)
      .multilineTextAlignment(.center)
      .lineSpacing(4)
  }
}

struct BigNumberText: View {
  var text: String
  
  init(_ text: String) {
    self.text = text
  }
  
  var body: some View {
    Text(text)
      .font(.largeTitle)
      .fontWeight(.black)
      .foregroundColor(Color("TextColor"))
      .kerning(-1)
  }
}

struct LabelText: View {
  var text: String
  
  init(_ text: String) {
    self.text = text
  }
  
  var body: some View {
    Text(text)
      .font(.caption)
      .bold()
      .foregroundColor(Color("TextColor"))
      .kerning(1.5)
      .multilineTextAlignment(.center)
  }
}

struct InfoNumberText: View {
  var text: String
  
  init(_ text: String) {
    self.text = text
  }
  
  var body: some View {
    Text(text)
      .font(.title2)
      .bold()
      .foregroundColor(Color("TextColor"))
      .kerning(-0.2)
      .multilineTextAlignment(.center)
  }
}

struct BodyText: View {
  var text: String
  
  init(_ text: String) {
    self.text = text
  }
  
  var body: some View {
    Text(text)
      .font(.subheadline)
      .fontWeight(.semibold)
      .foregroundColor(Color("TextColor"))
      .multilineTextAlignment(.center)
      .lineSpacing(12)
  }
}

struct ButtonText: View {
  var text: String
  
  init(_ text: String) {
    self.text = text
  }
  
  var body: some View {
    Text(text)
      .font(.body)
      .fontWeight(.bold)
      .foregroundColor(.white)
      .multilineTextAlignment(.center)
      .lineSpacing(16)
      .padding()
      .frame(maxWidth: .infinity)
      .background(Color("AccentColor"))
      .cornerRadius(12)
  }
}

struct ScoreText: View {
  var text: Int
  
  init(_ text: Int) {
    self.text = text
  }
  
  var body: some View {
    Text(String(text))
      .font(.title2)
      .fontWeight(.bold)
      .foregroundColor(Color("TextColor"))
      .kerning(-0.2)
      .multilineTextAlignment(.center)
      .lineSpacing(12)
  }
}

struct DateText: View {
  var text: Date
  
  init(_ text: Date) {
    self.text = text
  }
  
  var body: some View {
    Text(text, style: .time)
      .font(.title2)
      .fontWeight(.bold)
      .foregroundColor(Color("TextColor"))
      .kerning(-0.2)
      .multilineTextAlignment(.center)
      .lineSpacing(12)
  }
}

struct BigBoldText: View {
  var text: String
  
  init(_ text: String) {
    self.text = text
  }
  
  var body: some View {
    Text(text.uppercased())
      .font(.title)
      .fontWeight(.black)
      .foregroundColor(Color("TextColor"))
      .kerning(2)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText("Instructions".uppercased())
      BigNumberText("42")
      LabelText("Score".uppercased())
      InfoNumberText("999")
      BodyText("You scored 200 Points\n🎉🎉🎉")
      ButtonText("Start New Round")
      ScoreText(120)
      DateText(Date())
      BigBoldText("Leaderboard")
    }
    .padding()
  }
}
