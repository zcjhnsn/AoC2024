//
// Advent of Code 2024 Day 1
//
// https://adventofcode.com/2024/day/1
//

import AoCTools

final class Day01: AOCDay {
    let title = "Historian Hysteria"
    let list1: [Int]
    let list2: [Int]

    init(input: String) {
        let ints = input
            .lines
            .map { $0.allInts() }

        list1 = ints.map { $0[0] }
        list2 = ints.map { $0[1] }
    }

    func part1() -> Int {
        zip(list1.sorted(by: <), list2.sorted(by: <))
            .map { abs($0 - $1) }
            .reduce(0, +)
    }

    func part2() -> Int {
        var freq2 = [Int: Int]()
        for i in list2 {
            freq2[i, default: 0] += 1
        }
        return list1
            .map { $0 * freq2[$0, default: 0] }
            .reduce(0, +)
    }
}
