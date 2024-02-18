//
//  BowlingGameTDDTests.swift
//  BowlingGameTDDTests
//
//  Created by Mustafa Kemal Gökçe on 18.02.2024.
//

import XCTest

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
        rollStrike()
        game.roll(3)
        game.roll(4)
        rollMany(numberOfRolls: 16, pins: 0)
        
        XCTAssertEqual(24, game.score())
    }
    
    func testPerfectGame() {
        rollMany(numberOfRolls: 12, pins: 10)
        XCTAssertEqual(300, game.score())
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
    
    private func rollStrike() {
        game.roll(10)
    }
}
