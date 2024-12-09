//
// Advent of Code 2024 Day 5
//
// https://adventofcode.com/2024/day/5
//

import AoCTools

private struct Rule: Hashable {
    let first: Int
    let second: Int
}

final class Day05: AOCDay {
    let title = "Print Queue"
    private let rules: Set<Rule>
    private let updates: [[Int]]

    init(input: String) {
        let groups = input.lines.grouped(by: \.isEmpty)

        rules = Set(
            groups[0]
                .map { $0.allInts() }
                .map { Rule(first: $0[0], second: $0[1]) }
        )

        updates = groups[1]
            .map { $0.allInts() }
    }

    func part1() -> Int {
        updates.reduce(into: 0) { sum, update in
            if validUpdate(update) {
                // add middle value of update to sum
                sum += update[update.count / 2]
            }
        }
    }

    private func validUpdate(_ update: [Int]) -> Bool {
        // get all combinations of pairs in update,
        // create Rules for them,
        // make sure rules contains the new rules
        update
            .combinations(ofCount: 2)
            .map { Rule(first: $0[0], second: $0[1]) }
            .allSatisfy { rules.contains($0) }
    }

    func part2() -> Int {
        updates
            .filter { !validUpdate($0) }
            .reduce(into: 0) { sum, invalidUpdate in
                let sorted = invalidUpdate.sorted { first, second in
                    rules.contains(Rule(first: first, second: second))
                }
                sum += sorted[sorted.count / 2]
            }
    }
}
