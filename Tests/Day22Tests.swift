//
// Advent of Code 2024 Day 22 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 22 Tests")
struct Day22Tests {
    @MainActor @Test("Day 22 Part 1")
    func testDay22_part1() {
        let day = Day22(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 22 Part 1 Solution")
    func testDay22_part1_solution() {
        let day = Day22(input: Day22.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 22 Part 2")
    func testDay22_part2() {
        let day = Day22(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 22 Part 2 Solution")
    func testDay22_part2_solution() {
        let day = Day22(input: Day22.input)
        #expect(day.part2() == 0)
    }
}
