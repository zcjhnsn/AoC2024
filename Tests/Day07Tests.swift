//
// Advent of Code 2024 Day 7 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 7 Tests")
struct Day07Tests {
    @MainActor @Test("Day 7 Part 1")
    func testDay07_part1() {
        let day = Day07(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 7 Part 1 Solution")
    func testDay07_part1_solution() {
        let day = Day07(input: Day07.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 7 Part 2")
    func testDay07_part2() {
        let day = Day07(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 7 Part 2 Solution")
    func testDay07_part2_solution() {
        let day = Day07(input: Day07.input)
        #expect(day.part2() == 0)
    }
}
