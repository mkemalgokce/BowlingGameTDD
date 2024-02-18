//
//  BowlingGameTDDTests.swift
//  BowlingGameTDDTests
//
//  Created by Mustafa Kemal Gökçe on 18.02.2024.
//

import XCTest

class Game {
    private var rolls: [Int] = []

    func roll(_ pins: Int) {
        rolls.append(pins)
    }
    
    func score() -> Int {
        var score = 0
        var i = 0
        
        for frame in 0 ..< 10 {
            if (rolls[i] + rolls[i+1] == 10) {
                score += 10 + rolls[i+2]
            }else {
                score += rolls[i] + rolls[i + 1]
            }
            
            i += 2
        }
        
        return score
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
        game.roll(5)
        game.roll(5) // spare
        game.roll(3)
        rollMany(numberOfRolls: 17, pins: 0)
        
        XCTAssertEqual(16, game.score())
        
    }
    
    //MARK: - Helpers
    func rollMany(numberOfRolls n: Int, pins: Int) {
        for i in 0 ..< n {
            game.roll(pins)
        }
    }
}
