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
        var list1 = [Int]()
        var list2 = [Int]()
        for line in input.lines {
            let ids = line.allInts()
            list1.append(ids[0])
            list2.append(ids[1])
        }
        self.list1 = list1
        self.list2 = list2
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
