//
// Advent of Code 2024 Day 12 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 12 Tests")
struct Day12Tests {
    @MainActor @Test("Day 12 Part 1")
    func testDay12_part1() {
        let day = Day12(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 12 Part 1 Solution")
    func testDay12_part1_solution() {
        let day = Day12(input: Day12.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 12 Part 2")
    func testDay12_part2() {
        let day = Day12(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 12 Part 2 Solution")
    func testDay12_part2_solution() {
        let day = Day12(input: Day12.input)
        #expect(day.part2() == 0)
    }
}
