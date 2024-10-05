//
// Advent of Code 2024 Day 3 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 3 Tests") 
struct Day03Tests {
    @MainActor @Test("Day 3 Part 1")
    func testDay03_part1() {
        let day = Day03(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 3 Part 1 Solution")
    func testDay03_part1_solution() {
        let day = Day03(input: Day03.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 3 Part 2")
    func testDay03_part2() {
        let day = Day03(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 3 Part 2 Solution")
    func testDay03_part2_solution() {
        let day = Day03(input: Day03.input)
        #expect(day.part2() == 0)
    }
}
