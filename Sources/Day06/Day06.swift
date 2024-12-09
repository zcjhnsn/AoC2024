//
// Advent of Code 2024 Day 6
//
// https://adventofcode.com/2024/day/6
//

import AoCTools

final class Day06: AOCDay {
    let title = "Guard Gallivant"
    let grid: Grid<Character>
    let start: Point
    let traversablePoints: Int

    init(input: String) {
        self.grid = Grid<Character>.parse(input)
        self.start = grid.points.first(where: { $1 == "^" })!.key
        self.traversablePoints = grid.points.count { $0.value == "." }
    }

    private func findPath(from start: Point) -> Set<Point> {
        var visited: Set<Point> = [start]
        var direction = Direction.n
        var current = start
        while true {
            let next = current.moved(to: direction)
            switch grid.points[next] {
            case nil:
                return visited
            case "#":
                direction = direction.turned(.clockwise)
            case ".", "^":
                visited.insert(next)
                current = next
            default: fatalError("Invalid character in path: \(grid.points[next]!)")
            }
        }
    }
    func part1() -> Int {
        findPath(from: start).count
    }

    func part2() -> Int {
        var path = findPath(from: start)
        path.remove(start)

        // place an obstacle on every coordinate of the path
        var loops = 0
        for point in path {
            var grid = self.grid.points
            grid[point] = "#"

            var current = start
            var direction = Direction.n
            var steps = 0
            innerLoop: while true {
                // taken more steps than traversable points
                // must be in a loop
                if steps > traversablePoints {
                    loops += 1
                    break
                }
                let next = current.moved(to: direction)
                switch grid[next] {
                case nil:
                    break innerLoop
                case "#":
                    direction = direction.turned(.clockwise)
                case ".", "^":
                    current = next
                    steps += 1
                default: fatalError("Invalid character in path: \(grid[next]!)")
                }
            }
        }

        return loops
    }
}
