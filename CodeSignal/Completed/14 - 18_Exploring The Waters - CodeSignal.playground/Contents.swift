import UIKit

// MARK - Exploring The Waters ***********************************************

// Mark: 18 - palindromeRearranging
/*
 Given a string, find out if its characters can be rearranged to form a palindrome.
 
 Example:
 For inputString = "aabb", the output should be
 palindromeRearranging(inputString) = true.

 We can rearrange "aabb" to make "abba", which is a palindrome.
 */
func palindromeRearranging(inputString: String) -> Bool {
    var isPal = false
    
    switch Set(inputString).count {
    case 1:
        print("case 1")
        isPal = true
        
    case 2:
        print("case 2")
        if inputString.count % 2 != 0 && inputString.count < 4 { isPal = true } else { fallthrough }
        
    default:
        print("case default")
        var odd = 0
        var numOfChar = ""
        var countedChars = [String.Element]()
        for ch in inputString {
            numOfChar = inputString.filter { !countedChars.contains(ch) && $0 == ch }
            countedChars.append(ch)
            if numOfChar.count % 2 != 0 { odd += 1 }
            print("odd: \(odd)")
        }
        if odd > 1 { isPal = false } else { isPal = true }
    }
    
    return isPal
}

palindromeRearranging(inputString: "abbba")
// "aabb" = true
// "abbcabb" = true
// "z" = true
// "zaa" = true
// "abca"= false



// Mark: 17 - arrayChange
/*
 You are given an array of integers. On each move you are allowed to increase exactly one of its element by one. Find the minimal number of moves required to obtain a strictly increasing sequence from the input.

 For inputArray = [1, 1, 1], the output should be
 arrayChange(inputArray) = 3.

 */
func arrayChange(inputArray: [Int]) -> Int {
    var arr = inputArray
    var count = 0
    var delimiter = -100000

    startOver: for (i,_) in inputArray.enumerated() {
        while delimiter > arr[i] || delimiter == arr[i] {
            arr[i] += 1
            count += 1
        }
        delimiter = arr[i]
    }

    return count
}

arrayChange(inputArray: [3122, -645, 2616, 13213, -8069])
// [-1000, 0, -2, 0] = 5
// [1, 1, 1] = 3
// [3122, -645, 2616, 13213, -8069] = 25559



// Mark: 16 - Are Similar?
/*
 Two arrays are called similar if one can be obtained from another by swapping at most one pair of elements in one of the arrays.

 Given two arrays a and b, check whether they are similar.

 Example 1:
 For a = [1, 2, 3] and b = [1, 2, 3], the output should be
 areSimilar(a, b) = true.

 The arrays are equal, no need to swap any elements.

 Example 2
 For a = [1, 2, 3] and b = [2, 1, 3], the output should be
 areSimilar(a, b) = true.

 We can obtain b from a by swapping 2 and 1 in b.
 */
func areSimilar(a: [Int], b: [Int]) -> Bool {
    var diference = false

    if a.elementsEqual(b) {
        return true
    } else {
        let dif = zip(a, b).enumerated().filter({
            $1.0 != $1.1
        })

        if dif.count == 1 ||
            (dif.count == 2
                && dif[0].element.0 == dif[1].element.1
                && dif[0].element.1 == dif[1].element.0 ) {
            diference = true
        }
    }

    return diference
}

areSimilar(a: [1, 2, 3], b: [1, 10, 2])
// [1, 2, 3] and [1, 10, 2] = false
// [1, 1, 4] and [1, 2, 3] = false
// [1, 2, 3] and [2, 1, 3] = false



// Mark: 15 - Add Border
/*
 Given a rectangular matrix of characters, add a border of asterisks(*) to it.
 */
func addBorder(picture: [String]) -> [String] {
    var bordered = picture
    var border = ""

    for (i,arr) in zip(bordered.indices, bordered) {
        bordered[i].insert("*", at: arr.startIndex)
        bordered[i].append(contentsOf: "*")
    }

    for _ in 0..<bordered[0].count {
        border.append("*")
    }

    bordered.insert(border, at: bordered.startIndex)
    bordered.append(border)

    return bordered
}

addBorder(picture: ["abc",
                    "ded"])
// ["*****",
//  "*abc*",
//  "*ded*",
//  "*****"]



// Mark: 14 - alternatingSums
/*
 Several people are standing in a row and need to be divided into two teams. The first person goes into team 1, the second goes into team 2, the third goes into team 1 again, the fourth into team 2, and so on.

 You are given an array of positive integers - the weights of the people. Return an array of two integers, where the first element is the total weight of team 1, and the second element is the total weight of team 2 after the division is complete.
 */
func alternatingSums(a: [Int]) -> [Int] {
    var totals: [Int] = [0,0]
    var toggle = true

    for val in a {
        if toggle {
            totals[0] += val
            toggle.toggle()
        } else {
            totals[1] += val
            toggle.toggle()
        }
    }
    return totals
}

alternatingSums(a: [50, 60, 60, 45, 70])
 [180, 105]

// ***************************************************************************


