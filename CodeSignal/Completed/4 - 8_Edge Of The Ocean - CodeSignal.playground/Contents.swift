import UIKit

// MARK - Edge Of The Ocean *****************************************************

// Mark: 8 - matrixElementsSum
/*
 After becoming famous, the CodeBots decided to move into a new building together. Each of the rooms has a different cost, and some of them are free, but there's a rumour that all the free rooms are haunted! Since the CodeBots are quite superstitious, they refuse to stay in any of the free rooms, or any of the rooms below any of the free rooms.

 Given matrix, a rectangular matrix of integers, where each value represents the cost of the room, your task is to return the total sum of all rooms that are suitable for the CodeBots (ie: add up all the values that don't appear below a 0).
 */
func matrixElementsSum(matrix: [[Int]]) -> Int {
    var total = 0
    var columsWithZero = [Int]()
    
    for (_, floor) in matrix.enumerated() {
        for (j, room) in floor.enumerated() {
            if room == 0 {
                columsWithZero.append(j)
            }
            
            if !columsWithZero.contains(j) {
                total += room
            }
        }
    }
    
    return total
}

matrixElementsSum(matrix: [[0,1,1,2],
                           [0,5,0,0],
                           [2,0,3,3]])
// 9



// Mark: 7 - almoseIncreasingSequence
/*
 Given a sequence of integers as an array, determine whether it is possible to obtain a strictly increasing sequence by removing no more than one element from the array.
 Note: sequence a0, a1, ..., an is considered to be a strictly increasing if a0 < a1 < ... < an. Sequence containing only one element is also considered to be strictly increasing.
 */
func almostIncreasingSequence(sequence: [Int]) -> Bool {
    var isAlmostIncreasing = false
    var delimiter: (Int,[Int]) = (-100000, [])

    // Get indexes of anomalies
    anomaly: for (i, val) in sequence.enumerated() {
        if val <= delimiter.0 {
            delimiter.1.append(i)
        } else /*if val > delimiter.0*/ {
            delimiter.0 = val
        }
    }
    
    // Remove anomaly and check
    print("Started anomaly check")
    switch delimiter.1.count {
    case 0:
        isAlmostIncreasing = true
        print("case 0")
    
    case 1:
        delimiter.0 = -100000
        var seq = sequence
        let _ = seq.remove(at: delimiter.1[0])
        print("\(seq) after remove")
        for (i, val) in seq.enumerated() {
            if val <= delimiter.0 {
                print("case 1 false")
            } else {
                if i == seq.endIndex-1 {
                    print("end index met")
                    isAlmostIncreasing = true
                    print("case 1 true")
                }
                delimiter.0 = val
            }
        }
        
    default:
        print("default case")
        close: if sequence[0] > sequence[sequence.endIndex-1] {
            print("check first is larger than last")
            delimiter.0 = -100000
            for (i, val) in sequence.dropFirst().enumerated() {
                print(i)
                if val <= delimiter.0 {
                    print("default case false")
                    break close
                } else {
                    if i == sequence.count-2 {
                        print("end index met")
                        isAlmostIncreasing = true
                        print("default case true")
                        break close
                    }
                    delimiter.0 = val
                }
            }
        } else {
            print("check removing preceding anomaly index")
            delimiter.0 = -100000
            var seq = sequence
            let precedingIndex = delimiter.1[0] - 1
            let _ = seq.remove(at: precedingIndex)
            for (i, val) in seq.enumerated() {
                print(i)
                if val <= delimiter.0 {
                    print("default preceding case false")
                    break close
                } else {
                    if i == sequence.count-2 {
                        print("end index met")
                        isAlmostIncreasing = true
                        print("default preceding case true")
                        break close
                    }
                    delimiter.0 = val
                }
            }
        }
    }
    
    return isAlmostIncreasing
}

almostIncreasingSequence(sequence: [1, 3, 2, 1])
// Tests
//1, 3, 2, 1 false
//1, 3, 2 true
//1, 2, 1, 2 false
//3, 6, 5, 8, 10, 20, 15 false
//1, 1, 2, 3, 4, 4 false
//1, 4, 10, 4, 2 false
//10, 1, 2, 3, 4, 5 true
//1, 1, 1, 2, 3 false
//0, -2, 5, 6 true
//1, 2, 3, 4, 5, 3, 5, 6 false
//40, 50, 60, 10, 20, 30 false
//1, 1 true
//1, 2, 5, 3, 5 true
//1, 2, 5, 5, 5 false
//10, 1, 2, 3, 4, 5, 6, 1 false
//1, 2, 3, 4, 3, 6 true
//1, 2, 3, 4, 99, 5, 6 true
//123, -17, -5, 1, 2, 3, 12, 43, 45 true
//3, 5, 67, 98, 3 true



// Mark: 6 - Make Array Consecutive 2
/*
 Ratiorg got statues of different sizes as a present from CodeMaster for his birthday, each statue having an non-negative integer size. Since he likes to make things perfect, he wants to arrange them from smallest to largest so that each statue will be bigger than the previous one exactly by 1. He may need some additional statues to be able to accomplish that. Help him figure out the minimum number of additional statues needed.
 */
func makeArrayConsecutive2(statues: [Int]) -> Int {
    let orderedStatues = statues.sorted { $0 < $1 }
    
    // count how many integers are inbetween each element
    var count = 0
    for (index, statue) in orderedStatues.enumerated() {
        if index != 0 && index <= orderedStatues.endIndex - 1 {
            let value = statue - orderedStatues[index - 1]
            print("value: \(value)")
            if abs(value) > 1 {
                count += (value - 1)
                print("count: \(count)")
            }
        }
    }
    return count
}

makeArrayConsecutive2(statues: [6, 2, 3, 8])
// 3



// Mark: 5 - shapeArea
/*
 Below we will define an n-interesting polygon. Your task is to find the area of a polygon for a given n.

 A 1-interesting polygon is just a square with a side of length 1. An n-interesting polygon is obtained by taking the n - 1-interesting polygon and appending 1-interesting polygons to its rim, side by side. You can see the 1-, 2-, 3- and 4-interesting polygons in the picture below.
 */
func shapeArea(n: Int) -> Int {
    return (1 + (n-1) * n) * 2 - 1
}

shapeArea(n: 2)
// 5



// Mark: 4 - adjacentElementsProduct
/*
 Given an array of integers, find the pair of adjacent elements that has the largest product and return that product.
 */
func adjacentElementsProduct(inputArray: [Int]) -> Int {
    var temp = 0
    var prev = 0
    var largest = -255
    
    for (i, j) in inputArray.enumerated() {
        if i > 0 {
            prev = inputArray[i - 1]
            temp = j * prev
            
            if temp > largest {
                largest = temp
            }
            
            temp -= prev
        }
    }
    return largest
}

adjacentElementsProduct(inputArray: [3, 6, -2, -5, 7, 3])
// 21

// ******************************************************************************
