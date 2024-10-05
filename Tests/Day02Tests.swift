//
// Advent of Code 2024 Day 2 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 2 Tests") 
struct Day02Tests {
    @MainActor @Test("Day 2 Part 1")
    func testDay02_part1() {
        let day = Day02(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 2 Part 1 Solution")
    func testDay02_part1_solution() {
        let day = Day02(input: Day02.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 2 Part 2")
    func testDay02_part2() {
        let day = Day02(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 2 Part 2 Solution")
    func testDay02_part2_solution() {
        let day = Day02(input: Day02.input)
        #expect(day.part2() == 0)
    }
}
