//
//  BowlingGameTDDTests.swift
//  BowlingGameTDDTests
//
//  Created by Mustafa Kemal Gökçe on 18.02.2024.
//

import XCTest

class Game {
    
    func roll(_ pins: Int) {
        
    }
    
    func score() -> Int {
        return 0
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
}
