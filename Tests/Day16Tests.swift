//
// Advent of Code 2024 Day 16 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 16 Tests") 
struct Day16Tests {
    @MainActor @Test("Day 16 Part 1")
    func testDay16_part1() {
        let day = Day16(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 16 Part 1 Solution")
    func testDay16_part1_solution() {
        let day = Day16(input: Day16.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 16 Part 2")
    func testDay16_part2() {
        let day = Day16(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 16 Part 2 Solution")
    func testDay16_part2_solution() {
        let day = Day16(input: Day16.input)
        #expect(day.part2() == 0)
    }
}
