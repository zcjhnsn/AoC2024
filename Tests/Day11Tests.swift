//
// Advent of Code 2024 Day 11 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 11 Tests") 
struct Day11Tests {
    @MainActor @Test("Day 11 Part 1")
    func testDay11_part1() {
        let day = Day11(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 11 Part 1 Solution")
    func testDay11_part1_solution() {
        let day = Day11(input: Day11.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 11 Part 2")
    func testDay11_part2() {
        let day = Day11(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 11 Part 2 Solution")
    func testDay11_part2_solution() {
        let day = Day11(input: Day11.input)
        #expect(day.part2() == 0)
    }
}
