//
//  BoardGeometryTest.swift
//  HnefataflTests
//
//  Created by Tony Jinks on 18/10/2019.
//  Copyright © 2019 Tony Jinks. All rights reserved.
//

import XCTest
import Hnefatafl

class BoardGeometryTests: XCTestCase {

    override func setUp() {
        setupBoardGeometry();
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIndexes() {
        for i in 0...numSquares - 1 {
            let sq = square(i)
            let index = sq.index
            XCTAssertEqual(i, index)
        }
    }
    
    func testAdjacentMiddle() {
        let sq = square(40)
        XCTAssertEqual(39, west(sq).index)
        XCTAssertEqual(41, east(sq).index)
        XCTAssertEqual(51, north(sq).index)
        XCTAssertEqual(29, south(sq).index)
    }
    
    func testAdjacentLeftEdge() {
        let sq = square(44)
        XCTAssertTrue(west(sq).isEdge)
        XCTAssertEqual(45, east(sq).index)
        XCTAssertEqual(55, north(sq).index)
        XCTAssertEqual(33, south(sq).index)
    }
    
    func testAdjacentRightEdge() {
        let sq = square(43)
        XCTAssertTrue(east(sq).isEdge)
        XCTAssertEqual(42, west(sq).index)
        XCTAssertEqual(54, north(sq).index)
        XCTAssertEqual(32, south(sq).index)
    }
    
    func testAdjacentBottomEdge() {
        let sq = square(5)
        XCTAssertTrue(south(sq).isEdge)
        XCTAssertEqual(4, west(sq).index)
        XCTAssertEqual(16, north(sq).index)
        XCTAssertEqual(6, east(sq).index)
    }

    func square(_ i: Int32) -> Square {
        (bg?[Int(i)])!
    }
    
    func north(_ sq: Square?) -> Square {
        (sq?.north?.pointee)!
    }
    
    func south(_ sq: Square?) -> Square {
        (sq?.south?.pointee)!
    }
    
    func west(_ sq: Square?) -> Square {
        (sq?.west?.pointee)!
    }
    
    func east(_ sq: Square?) -> Square {
        (sq?.east?.pointee)!
    }
}
