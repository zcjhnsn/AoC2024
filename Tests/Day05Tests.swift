//
// Advent of Code 2024 Day 5 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 5 Tests") 
struct Day05Tests {
    @MainActor @Test("Day 5 Part 1")
    func testDay05_part1() {
        let day = Day05(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 5 Part 1 Solution")
    func testDay05_part1_solution() {
        let day = Day05(input: Day05.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 5 Part 2")
    func testDay05_part2() {
        let day = Day05(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 5 Part 2 Solution")
    func testDay05_part2_solution() {
        let day = Day05(input: Day05.input)
        #expect(day.part2() == 0)
    }
}
