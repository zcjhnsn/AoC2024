//
// Advent of Code 2024 Day 15 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 15 Tests") 
struct Day15Tests {
    @MainActor @Test("Day 15 Part 1")
    func testDay15_part1() {
        let day = Day15(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 15 Part 1 Solution")
    func testDay15_part1_solution() {
        let day = Day15(input: Day15.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 15 Part 2")
    func testDay15_part2() {
        let day = Day15(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 15 Part 2 Solution")
    func testDay15_part2_solution() {
        let day = Day15(input: Day15.input)
        #expect(day.part2() == 0)
    }
}
