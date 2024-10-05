//
// Advent of Code 2024 Day 17 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 17 Tests") 
struct Day17Tests {
    @MainActor @Test("Day 17 Part 1")
    func testDay17_part1() {
        let day = Day17(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 17 Part 1 Solution")
    func testDay17_part1_solution() {
        let day = Day17(input: Day17.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 17 Part 2")
    func testDay17_part2() {
        let day = Day17(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 17 Part 2 Solution")
    func testDay17_part2_solution() {
        let day = Day17(input: Day17.input)
        #expect(day.part2() == 0)
    }
}
