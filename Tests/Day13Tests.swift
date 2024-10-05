//
// Advent of Code 2024 Day 13 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 13 Tests") 
struct Day13Tests {
    @MainActor @Test("Day 13 Part 1")
    func testDay13_part1() {
        let day = Day13(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 13 Part 1 Solution")
    func testDay13_part1_solution() {
        let day = Day13(input: Day13.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 13 Part 2")
    func testDay13_part2() {
        let day = Day13(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 13 Part 2 Solution")
    func testDay13_part2_solution() {
        let day = Day13(input: Day13.input)
        #expect(day.part2() == 0)
    }
}
