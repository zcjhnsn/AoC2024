//
// Advent of Code 2024 Day 4
//
// https://adventofcode.com/2024/day/4
//

import AoCTools

final class Day04: AOCDay {

    let grid: Grid<Character>

    init(input: String) {
        self.grid = Grid<Character>.parse(input)
    }

    private func findXMAS(at p: Point) -> Int {
        // make sure the point starts with an x or an s
        guard ["X", "S"].contains(grid.points[p]) else { return 0 }

        // search behind and down. grid 0,0 is top left
        let directions: [Direction] = [.w, .sw, .s, .se]
        let sets = directions.map { dir in
            (0...3).map { steps in
                p.moved(to: dir, steps: steps)
            }
        }

        let search: [Character] = ["X", "M", "A", "S"]
        let searchReversed = Array(search.reversed())

        return sets
            .filter { set in
                // get points in grid from sets
                let cmp = set.map { grid.points[$0, default: " "] }
                return cmp == search || cmp == searchReversed
            }
            .count
    }

    func part1() -> Int {
        grid.points.keys.map { findXMAS(at: $0) }.sum()
    }

    private func findX_MAS(at p: Point) -> Bool {
        // make sure point contains an A
        guard grid.points[p] == "A" else { return false }

        // get diagonal sets
        let sets = [
            [p.moved(to: .ne), p, p.moved(to: .sw)],
            [p.moved(to: .nw), p, p.moved(to: .se)]
        ]

        let search: [Character] = ["M", "A", "S"]
        let searchReversed = Array(search.reversed())

        return sets.allSatisfy { set in
            // get points in grid from sets
            let cmp = set.map { grid.points[$0, default: " "] }
            return cmp == search || cmp == searchReversed
        }
    }

    func part2() -> Int {
        grid.points.keys.filter { findX_MAS(at: $0) }.count
    }
}

extension Character: @retroactive Drawable {
    public var draw: Character {
        self
    }

    public static func value(for ch: Character) -> Character {
        ch
    }
}
