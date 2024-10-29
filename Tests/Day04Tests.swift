//
// Advent of Code 2024 Day 4 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 4 Tests")
struct Day04Tests {
    @MainActor @Test("Day 4 Part 1")
    func testDay04_part1() {
        let day = Day04(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 4 Part 1 Solution")
    func testDay04_part1_solution() {
        let day = Day04(input: Day04.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 4 Part 2")
    func testDay04_part2() {
        let day = Day04(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 4 Part 2 Solution")
    func testDay04_part2_solution() {
        let day = Day04(input: Day04.input)
        #expect(day.part2() == 0)
    }
}
