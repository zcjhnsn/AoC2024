//
// Advent of Code 2024 Day 8
//
// https://adventofcode.com/2024/day/8
//

import AoCTools

final class Day08: AOCDay {
    let title = "Resonant Collinearity"

    var grid: Grid<Character>

    init(input: String) {
        self.grid = Grid<Character>.parse(input)
    }

    func part1() -> Int {
        grid.points
            .filter { $0.value != "." }
            .combinations(ofCount: 2)
            .filter { $0.first!.value == $0.last!.value}
            .map { ($0.first!.key, $0.last!.key) }
            .map { pair in
                // get rise and run
                let xDiff = pair.1.x - pair.0.x
                let yDiff = pair.1.y - pair.0.y

                let nextLeftPoint = Point(pair.0.x - xDiff, pair.0.y - yDiff)
                let nextRightPoint = Point(pair.1.x + xDiff, pair.1.y + yDiff)

                var points: [Point] = []
                if grid.points[nextLeftPoint] != nil && grid.points[nextLeftPoint] != "#" {
                    points.append(nextLeftPoint)
                }
                if grid.points[nextRightPoint] != nil && grid.points[nextRightPoint] != "#" {
                    points.append(nextRightPoint)
                }
                return points
            }
            .flatMap { $0 }
            .makeSet()
            .count
    }

    func part2() -> Int {
        grid.points
            .filter { $0.value != "." }
            .combinations(ofCount: 2)
            .filter { $0.first!.value == $0.last!.value}
            .map { ($0.first!.key, $0.last!.key) }
            .map { pair in
                // get rise and run
                let xDiff = pair.1.x - pair.0.x
                let yDiff = pair.1.y - pair.0.y

                var nextLeftPoint = Point(pair.0.x - xDiff, pair.0.y - yDiff)
                var nextRightPoint = Point(pair.1.x + xDiff, pair.1.y + yDiff)
                var leftPoints: [Point] = [pair.0]
                var rightPoints: [Point] = [pair.1]

                while grid.points[nextLeftPoint] != nil {
                    leftPoints.append(nextLeftPoint)
                    nextLeftPoint = Point(nextLeftPoint.x - xDiff, nextLeftPoint.y - yDiff)
                }

                while grid.points[nextRightPoint] != nil {
                    rightPoints.append(nextRightPoint)
                    nextRightPoint = Point(nextRightPoint.x + xDiff, nextRightPoint.y + yDiff)
                }

                return leftPoints + rightPoints
            }
            .flatMap { $0 }
            .makeSet()
            .count
    }
}
