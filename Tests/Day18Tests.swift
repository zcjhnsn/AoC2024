//
// Advent of Code 2024 Day 18 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 18 Tests") 
struct Day18Tests {
    @MainActor @Test("Day 18 Part 1")
    func testDay18_part1() {
        let day = Day18(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 18 Part 1 Solution")
    func testDay18_part1_solution() {
        let day = Day18(input: Day18.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 18 Part 2")
    func testDay18_part2() {
        let day = Day18(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 18 Part 2 Solution")
    func testDay18_part2_solution() {
        let day = Day18(input: Day18.input)
        #expect(day.part2() == 0)
    }
}
