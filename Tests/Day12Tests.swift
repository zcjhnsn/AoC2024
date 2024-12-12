//
// Advent of Code 2024 Day 12 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
AAAA
BBCD
BBCC
EEEC
"""

fileprivate let testInput2 = """
OOOOO
OXOXO
OOOOO
OXOXO
OOOOO
"""

fileprivate let testInput3 = """
RRRRIICCFF
RRRRIICCCF
VVRRRCCFFF
VVRCCCJFFF
VVVVCJJCFE
VVIVCCJJEE
VVIIICJJEE
MIIIIIJJEE
MIIISIJEEE
MMMISSJEEE
"""

fileprivate let testInput4 = """
EEEEE
EXXXX
EEEEE
EXXXX
EEEEE
"""

fileprivate let testInput5 = """
AAAAAA
AAABBA
AAABBA
ABBAAA
ABBAAA
AAAAAA
"""

@Suite("Day 12 Tests")
struct Day12Tests {
    @MainActor @Test("Day 12 Part 1 Test 1")
    func testDay12_part1_1() {
        let day = Day12(input: testInput)
        #expect(day.part1() == 140)
    }

    @MainActor @Test("Day 12 Part 1 Test 2")
    func testDay12_part1_2() {
        let day = Day12(input: testInput2)
        #expect(day.part1() == 772)
    }
    
    @MainActor @Test("Day 12 Part 1 Test 3")
    func testDay12_part1_3() {
        let day = Day12(input: testInput3)
        #expect(day.part1() == 1930)
    }
    
    @MainActor @Test("Day 12 Part 1 Solution")
    func testDay12_part1_solution() {
        let day = Day12(input: Day12.input)
        #expect(day.part1() == 1473620)
    }

    @MainActor @Test("Day 12 Part 2 Test 1")
    func testDay12_part2() {
        let day = Day12(input: testInput)
        #expect(day.part2() == 80)
    }

    @MainActor @Test("Day 12 Part 2 Test 2")
    func testDay12_part2_2() {
        let day = Day12(input: testInput2)
        #expect(day.part2() == 436)
    }

    @MainActor @Test("Day 12 Part 2 Test 3")
    func testDay12_part2_3() {
        let day = Day12(input: testInput4)
        #expect(day.part2() == 236)
    }

    @MainActor @Test("Day 12 Part 2 Test 4")
    func testDay12_part2_4() {
        let day = Day12(input: testInput5)
        #expect(day.part2() == 368)
    }
    @MainActor @Test("Day 12 Part 2 Solution")
    func testDay12_part2_solution() {
        let day = Day12(input: Day12.input)
        #expect(day.part2() == 902620)
    }
}
