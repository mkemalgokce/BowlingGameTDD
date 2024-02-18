//
//  Game.swift
//  BowlingGameTDD
//
//  Created by Mustafa Kemal Gökçe on 18.02.2024.
//

import Foundation

public final class Game {
    private var rolls: [Int] = Array(repeating: 0, count: 21)
    private var currentRoll = 0
    
    public init() {}
    
    public func roll(_ pins: Int) {
        rolls[currentRoll] = pins
        currentRoll += 1
    }
    
    public func score() -> Int {
        var score = 0
        var firstInFrame = 0
        
        for _ in 0 ..< 10 {
            if (isStrike(firstInFrame)) {
                score += 10 + nextTwoBallsForStrike(firstInFrame)
                firstInFrame += 1
            }else if (isSpare(firstInFrame)) {
                score += 10 + nextBallForSpare(firstInFrame)
                firstInFrame += 2
            }else {
                score += twoBallsInFrame(firstInFrame)
                firstInFrame += 2
            }

        }
        
        return score
    }
    
    private func isStrike(_ firstInFrame: Int) -> Bool {
        rolls[firstInFrame] == 10
    }
    
    private func isSpare(_ firstInFrame: Int) -> Bool {
        rolls[firstInFrame] + rolls[firstInFrame + 1] == 10
    }
    
    private func twoBallsInFrame(_ firstInFrame: Int) -> Int {
        rolls[firstInFrame] + rolls[firstInFrame + 1]
    }
    
    private func nextTwoBallsForStrike(_ firstInFrame: Int) -> Int {
        rolls[firstInFrame + 1] + rolls[firstInFrame + 2]
    }
    
    private func nextBallForSpare(_ firstInFrame: Int) -> Int {
        rolls[firstInFrame + 2]
    }
}
