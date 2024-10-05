//
// Advent of Code 2024 Day 14 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 14 Tests") 
struct Day14Tests {
    @MainActor @Test("Day 14 Part 1")
    func testDay14_part1() {
        let day = Day14(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 14 Part 1 Solution")
    func testDay14_part1_solution() {
        let day = Day14(input: Day14.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 14 Part 2")
    func testDay14_part2() {
        let day = Day14(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 14 Part 2 Solution")
    func testDay14_part2_solution() {
        let day = Day14(input: Day14.input)
        #expect(day.part2() == 0)
    }
}
