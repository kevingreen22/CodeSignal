import Foundation

// MARK: Island Of Knowledge *******************************************

// Mark: 24 - Minesweeper
/*
 In the popular Minesweeper game you have a board with some mines and those cells that don't contain a mine have a number in it that indicates the total number of mines in the neighboring cells. Starting off with some arrangement of mines we want to create a Minesweeper game setup.
 */
func minesweeper(matrix: [[Bool]]) -> [[Int]] {
    var inner = [Int]()
    var mines = [[Int]]()
    var currentCount = 0
    
    for (i,val) in matrix.enumerated() {
        for j in val.indices {
            print(i, j)
            switch i {
            case 0: // if top row, only check current row and row below
                print("case 0")
                // current row
                if j>0,           matrix[i][j-1] == true { print("a"); currentCount += 1 }
                if j<val.count-1, matrix[i][j+1] == true { print("b"); currentCount += 1 }
                
                // row below
                if j>0,           matrix[i+1][j-1] == true { print("c"); currentCount += 1 }
                if                matrix[i+1][j] == true { print("d"); currentCount += 1 }
                if j<val.count-1, matrix[i+1][j+1] == true { print("e"); currentCount += 1 }
                
                
            case matrix.count-1: // if last row, only check row above and current row
                print("case count-1")
                // row above
                if j>0,           matrix[i-1][j-1] == true { print("f"); currentCount += 1 }
                if                matrix[i-1][j] == true { print("g"); currentCount += 1 }
                if j<val.count-1, matrix[i-1][j+1] == true { print("h"); currentCount += 1 }
                
                // current row
                if j>0,           matrix[i][j-1] == true { print("i"); currentCount += 1 }
                if j<val.count-1, matrix[i][j+1] == true { print("j"); currentCount += 1 }
                
                
            default:
                print("case default")
                // row above
                if j>0,           matrix[i-1][j-1] == true { currentCount += 1 }
                if                matrix[i-1][j] == true { currentCount += 1 }
                if j<val.count-1, matrix[i-1][j+1] == true { currentCount += 1 }
                
                // current row
                if j>0,           matrix[i][j-1] == true { currentCount += 1 }
                if j<val.count-1, matrix[i][j+1] == true { currentCount += 1 }
                
                // row below
                if j>0,           matrix[i+1][j-1] == true { currentCount += 1 }
                if                matrix[i+1][j] == true { currentCount += 1 }
                if j<val.count-1, matrix[i+1][j+1] == true { currentCount += 1 }
            }
            
            inner.append(currentCount)
            currentCount = 0
        }
        
        mines.append(inner)
        inner.removeAll()
    }
    
    print(mines)
    return mines
}

minesweeper(matrix: [[false,true,true,false],
                     [true,true,false,true],
                     [false,false,true,false]])
// [[false,true,true,false],
//  [true,true,false,true],
//  [false,false,true,false]] = [[3,3,3,2],
//                               [2,4,5,2],
//                               [2,3,2,2]]



// Mark: 23 - Box Blur
/*
 Last night you partied a little too hard. Now there's a black and white photo of you that's about to go viral! You can't let this ruin your reputation, so you want to apply the box blur algorithm to the photo to hide its content.

 The pixels in the input image are represented as integers. The algorithm distorts the input image in the following way: Every pixel x in the output image has a value equal to the average value of the pixel values from the 3 × 3 square that has its center at x, including x itself. All the pixels on the border of x are then removed.

 Return the blurred image as an integer, with the fractions rounded down.
 
 For

 image = [[1, 1, 1],
          [1, 7, 1],
          [1, 1, 1]]
 the output should be boxBlur(image) = [[1]].

 To get the value of the middle pixel in the input 3 × 3 square: (1 + 1 + 1 + 1 + 7 + 1 + 1 + 1 + 1) = 15 / 9 = 1.66666 = 1. The border pixels are cropped from the final result.

 For

 image = [[7, 4, 0, 1],
          [5, 6, 2, 2],
          [6, 10, 7, 8],
          [1, 4, 2, 0]]
 the output should be

 boxBlur(image) = [[5, 4],
                   [4, 4]]
 There are four 3 × 3 squares in the input image, so there should be four integers in the blurred output. To get the first value: (7 + 4 + 0 + 5 + 6 + 2 + 6 + 10 + 7) = 47 / 9 = 5.2222 = 5. The other three integers are obtained the same way, then the surrounding integers are cropped from the final result.
 */
func boxBlur(image: [[Int]]) -> [[Int]] {
    var inner = [Int]()
    var blur = [[Int]]()
    var total = 0
    
    for (i,val) in image.enumerated() {
        for j in val.indices {
            if i != 0 && j != 0 && i != image.count-1 && j != val.count-1 {
                total = image[i-1][j+1] +
                    image[i][j+1] +
                    image[i+1][j+1] +
                    
                    image[i-1][j] +
                    image[i][j] +
                    image[i+1][j] +
                    
                    image[i-1][j-1] +
                    image[i][j-1] +
                    image[i+1][j-1]
                
                inner.append(total / 9)
            }
        }
        
        if !inner.isEmpty {
            blur.append(inner)
            inner.removeAll()
        }
    }
    
    return blur
}

boxBlur(image: [[0,18,9],
                [27,9,0],
                [81,63,45]])
// [[1,1,1],
// [1,7,1],
// [1,1,1]] = [[1]]

// [[0,18,9],
//  [27,9,0],
//  [81,63,45]] = [[28]]

// [[7,4,0,1],
//  [5,6,2,2],
//  [6,10,7,8],
//  [1,4,2,0]] = [[5,4],
//                [4,4]]



// Mark: 22 - avoidObstacles
/*
 You are given an array of integers representing coordinates of obstacles situated on a straight line.

 Assume that you are jumping from the point with coordinate 0 to the right. You are allowed only to make jumps of the same length represented by some integer.

 Find the minimal length of the jump enough to avoid all the obstacles.
 
 Example

 For inputArray = [5, 3, 6, 7, 9], the output should be
 avoidObstacles(inputArray) = 4.
 */
func avoidObstacles(inputArray: [Int]) -> Int {
    var jump = 1
    var extruded = [Bool]()
    
    for i in 0..<(inputArray.max()! + 1) {
        extruded.append(inputArray.contains(i) ? true : false)
    }
        
    for _ in 0..<(inputArray.max()! + 1) {
        restart: for i in stride(from: 0, through: extruded.count-1, by: jump) {
            if extruded[i] == true {
                jump += 1
                break restart
            }
        }
    }
    return jump
}

avoidObstacles(inputArray: [5, 3, 6, 7, 9])
// [5, 3, 6, 7, 9] = 4
// [2,3] = 4
// [1,4,10,6,2] = 7
// [1000, 999] = 6



// Mark: 21 - isIPv4Address
/*
 An IP address is a numerical label assigned to each device (e.g., computer, printer) participating in a computer network that uses the Internet Protocol for communication. There are two versions of the Internet protocol, and thus two versions of addresses. One of them is the IPv4 address.

 Given a string, find out if it satisfies the IPv4 address naming rules.
 */
func isIPv4Address(inputString: String) -> Bool {
//    var sin = sockaddr_in()
//    if inputString.withCString({ cstring in inet_pton(AF_INET, cstring, &sin.sin_addr) }) == 1 {
//        return true
//    } else { return false }
    
    var ipv4 = false
    let groups = inputString.split(separator: ".", omittingEmptySubsequences: false)
    if groups.count == 4 { ipv4 = true }
    print(groups)
    done: for val in groups {
//        print(val)
        if val[val.startIndex] != "0" || val != "" { ipv4 = true } else { ipv4 = false; break done }
        print(val)
        if let group = Int(val) {
            if group > 0 || group < 255 {
                ipv4 = true
            } else { ipv4 = false; break done }
        } else { ipv4 = false; break done }
    }
    
    return ipv4
}

isIPv4Address(inputString: "0..1.0.0")
// true



// Mark: 20 - arrayMaximalAdjacentDifference
/*
 Given an array of integers, find the maximal absolute difference between any two of its adjacent elements.
 */
func arrayMaximalAdjacentDifference(inputArray: [Int]) -> Int {
    var prev: Int?
    var differences = [Int]()
    
    for (i,val) in inputArray.enumerated() {
        if i < inputArray.endIndex && prev != nil {
            differences.append(abs(val - prev!))
        }
        prev = val
    }
    print(differences)
    return differences.max()!
}

arrayMaximalAdjacentDifference(inputArray: [2, 4, 1, 0])
// [2, 4, 1, 0] = 3



// Mark: 19 - areEquallyStrong
/*
 Call two arms equally strong if the heaviest weights they each are able to lift are equal.

 Call two people equally strong if their strongest arms are equally strong (the strongest arm can be both the right and the left), and so are their weakest arms.

 Given your and your friend's arms' lifting capabilities find out if you two are equally strong.
 */
func areEquallyStrong(yourLeft: Int, yourRight: Int, friendsLeft: Int, friendsRight: Int) -> Bool {
    let you = [yourLeft, yourRight]
    let friend = [friendsLeft, friendsRight]
    
    if you.elementsEqual(friend) || you.elementsEqual(friend.reversed()) {
        return true
    } else { return false }
}

areEquallyStrong(yourLeft: 10, yourRight: 15, friendsLeft: 15, friendsRight: 10)
// 10, 15, 15, 10 = true

// *********************************************************************
