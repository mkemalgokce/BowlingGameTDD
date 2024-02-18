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
    
    func testCanRoll() {
        game.roll(0)
    }
    
    func testGutterGame() {
        for i in 0 ..< 20 {
            game.roll(0)
        }
        
        XCTAssertEqual(game.score(), 0)
    }
    
    func testAllOnes() {
        for i in 0 ..< 20 {
            game.roll(1)
        }
        
        XCTAssertEqual(20, game.score())
    }
}
