//
// Advent of Code 2024 Day 2
//
// https://adventofcode.com/2024/day/2
//

import AoCTools
import Algorithms

private struct Report {
    let data: [Int]
    let pairs: [(Int, Int)]

    init(data: [Int]) {
        self.data = data
        self.pairs = data.adjacentPairs().map { ($0.0, $0.1) }
    }

    var isSafe: Bool {
        pairs.allSatisfy(increasing) || pairs.allSatisfy(decreasing)
    }

    var isSafeWithDampener: Bool {
        if isSafe {
            return true
        }

        let firstNonInc = pairs
            .enumerated()
            .first { index, element in !increasing(element.0, element.1) }
        let firstNonDec = pairs
            .enumerated()
            .first { index, element in !decreasing(element.0, element.1) }

        for check in [firstNonInc!, firstNonDec!] {
            for index in [check.0, check.0 + 1] {
                var data = self.data
                data.remove(at: index)
                let report = Report(data: data)
                if report.isSafe {
                    return true
                }
            }
        }

        return false
    }

    func increasing(_ a: Int, _ b: Int) -> Bool {
        b > a && b - a < 4
    }

    func decreasing(_ a: Int, _ b: Int) -> Bool {
        a > b && a - b < 4
    }
}

final class Day02: AOCDay {
    let title = "Red-Nosed Reports"

    private let reports: [Report]

    init(input: String) {
        reports = input.lines.map { Report(data: $0.allInts()) }
    }

    func part1() -> Int {
        reports
            .filter { $0.isSafe }
            .count
    }

    func part2() -> Int {
        reports
            .filter { $0.isSafeWithDampener }
            .count
    }
}
