//
//  BowlingGameTDDTests.swift
//  BowlingGameTDDTests
//
//  Created by Mustafa Kemal Gökçe on 18.02.2024.
//

import XCTest

class Game {
    private var rolls: [Int] = Array(repeating: 0, count: 21)
    private var currentRoll = 0
    
    func roll(_ pins: Int) {
        rolls[currentRoll] = pins
        currentRoll += 1
    }
    
    func score() -> Int {
        var score = 0
        var firstInFrame = 0
        
        for frame in 0 ..< 10 {
            if (rolls[firstInFrame] == 10) {
                score += 10 + rolls[firstInFrame + 1] + rolls[firstInFrame + 2]
                firstInFrame += 1
            }else if (isSpare(firstInFrame)) {
                score += 10 + rolls[firstInFrame + 2]
                firstInFrame += 2
            }else {
                score += rolls[firstInFrame] + rolls[firstInFrame + 1]
                firstInFrame += 2
            }

        }
        
        return score
    }
    
    func isSpare(_ firstInFrame: Int) -> Bool {
        rolls[firstInFrame] + rolls[firstInFrame + 1] == 10
    }
}

final class BowlingGameTDDTests: XCTestCase {
    private var game: Game!
    
    override func setUp() {
        super.setUp()
        game = Game()
    }
    
    func testGutterGame() {
        rollMany(numberOfRolls: 20, pins: 0)

        XCTAssertEqual(game.score(), 0)
    }
    
    func testAllOnes() {
        rollMany(numberOfRolls: 20, pins: 1)
        
        XCTAssertEqual(20, game.score())
    }
    
    func testOneSpare() {
        rollSpare()
        game.roll(3)
        rollMany(numberOfRolls: 17, pins: 0)
        
        XCTAssertEqual(16, game.score())
    }
    
    func testOneStrike() {
        game.roll(10) // strike
        game.roll(3)
        game.roll(4)
        rollMany(numberOfRolls: 16, pins: 0)
        XCTAssertEqual(24, game.score())
        
    }
    
    //MARK: - Helpers
    private func rollMany(numberOfRolls n: Int, pins: Int) {
        for _ in 0 ..< n {
            game.roll(pins)
        }
    }
    
    private func rollSpare() {
        game.roll(5)
        game.roll(5)
    }
}
