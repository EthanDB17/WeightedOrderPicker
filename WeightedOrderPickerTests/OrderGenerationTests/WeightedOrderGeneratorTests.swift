//
//  WeightedOrderGeneratorTests.swift
//  WeightedOrderPickerTests
//
//  Created by Ethan Borrowman on 8/25/24.
//

import Testing
@testable import WeightedOrderPicker

struct WeightedOrderGeneratorTests {

    @Test func testOrderGeneratorFinalCount() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let sut = WeightedOrderGenerator()
        let startingList: [ListItem] = [.init(name: "One", weight: 1), .init(name: "Two", weight: 2), .init(name: "Three", weight: 3)]
        let orderedList = sut.generateWeightedOrder(list: startingList)
        #expect(orderedList.count == startingList.count)
        #expect(orderedList.contains("One"))
        #expect(orderedList.contains("Two"))
        #expect(orderedList.contains("Three"))
    }

}
