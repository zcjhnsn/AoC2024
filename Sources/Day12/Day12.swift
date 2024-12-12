//
// Advent of Code 2024 Day 12
//
// https://adventofcode.com/2024/day/12
//

import AoCTools

final class Day12: AOCDay {
    let title = "Garden Groups"
    
    let grid: Grid<Character>
    
    init(input: String) {
        grid = Grid.parse(input)
    }
    
    func perimeter(for region: Set<Point>) -> Int {
        var result = 0
        for point in region {
            result += 4
            point.neighbors().forEach {
                if region.contains($0) {
                    result -= 1
                }
            }
        }
        return result
    }
    
    func regions() -> [Set<Point>] {
        var regions: [Set<Point>] = []
        var seen: Set<Point> = []
        
        for y in grid.minY...grid.maxY {
            for x in grid.minX...grid.maxX {
                let point = Point(x, y)
                if seen.contains(point) { continue }
                seen.insert(point)
                var region: Set<Point> = [point]
                var queue = [point]
                let plant = grid.points[point]
                while !queue.isEmpty {
                    let p = queue.removeFirst()
                    for neighbor in p.neighbors() {
                        if grid.points[neighbor] == nil { continue }
                        if grid.points[neighbor] != plant { continue }
                        if region.contains(neighbor) { continue }
                        region.insert(neighbor)
                        seen.insert(neighbor)
                        queue.append(neighbor)
                    }
                }
                regions.append(region)
            }
        }
        
        return regions
    }

    func part1() -> Int {
        regions()
            .map {
                $0.count * perimeter(for: $0)
            }
            .sum()
    }
    
    
    func sides(for region: Set<Point>) -> Int {
        // gather potential corner locations
        var cornerCandidates = Set<HalfPoint>()
        for point in region {
            let x = Double(point.x)
            let y = Double(point.y)
            // offset neighbors by 0.5 to get the edges
            [
                HalfPoint(x: x - 0.5, y: y - 0.5),
                HalfPoint(x: x - 0.5, y: y + 0.5),
                HalfPoint(x: x + 0.5, y: y + 0.5),
                HalfPoint(x: x + 0.5, y: y - 0.5)
            ].forEach {
                cornerCandidates.insert($0)
            }
        }
        
        var corners = 0
        
        for corner in cornerCandidates {
            var config = [Bool]()
            let cx = corner.x
            let cy = corner.y
            // given a corner, check if cells around it diagonally are in the region
            config = [
                Point(Int(cx - 0.5), Int(cy - 0.5)),
                Point(Int(cx - 0.5), Int(cy + 0.5)),
                Point(Int(cx + 0.5), Int(cy + 0.5)),
                Point(Int(cx + 0.5), Int(cy - 0.5))
            ].map { region.contains($0) }
            
            let number = config.reduce(0) { acc, val in
                return acc + val.intValue
            }
            
            // Note: there is no need to check 0 and 4. zero isn't possible because of our corner
            // candidates check. four means there is no corner anyway.
            if number == 1 {
                // ◼️◼️
                // ◼️◻️
                corners += 1
            } else if number == 2 {
                // see if squares in region are kitty-corner. This counts as two corners per problem statement.
                // ◼️◻️ is valid       ◻️◼️ is invalid
                // ◻️◼️                ◻️◼️
                if config == [true, false, true, false] || config == [false, true, false, true] {
                    corners += 2
                }
            } else if number == 3 {
                // this is an interior corner of three squares
                // ◻️◻️
                // ◻️◼️
                corners += 1
            }
        }
        
        return corners
    }
    
    func part2() -> Int {
        regions()
            .map {
                $0.count * sides(for: $0)
            }
            .sum()
    }
}

fileprivate struct HalfPoint: Hashable {
    let x, y: Double
}

extension Bool {
    var intValue: Int {
        return self ? 1 : 0
    }
}
