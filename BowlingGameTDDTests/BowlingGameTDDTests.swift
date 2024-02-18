//
//  BowlingGameTDDTests.swift
//  BowlingGameTDDTests
//
//  Created by Mustafa Kemal Gökçe on 18.02.2024.
//

import XCTest

class Game {
    private var gameScore: Int = 0
    
    func roll(_ pins: Int) {
        gameScore += pins
    }
    
    func score() -> Int {
        return gameScore
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
    
    func skip_testOneSpare() {
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
