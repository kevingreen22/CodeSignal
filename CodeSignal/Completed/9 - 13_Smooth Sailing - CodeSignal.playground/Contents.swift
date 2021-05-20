import UIKit

// MARK - SmoothSailing *********************************************

// Mark: 9 - All Longest Strings
/*
 Given an array of strings, return another array containing all of its longest strings.
 */
func allLongestStrings(inputArray: [String]) -> [String] {
    var longestStrings = [String]()
    var longestCount = 0
    
    for str in inputArray {
        if str.count > longestCount {
            longestCount = str.count
        }
    }
    
    for str in inputArray {
        if str.count == longestCount {
            longestStrings.append(str)
        }
    }
    
    return longestStrings
}

allLongestStrings(inputArray: ["aba","aa","ad","vcd","aba"])
// ["aba","vcd","aba"]



// Mark: 10 - commonCharacterCount
/*
 Given two strings, find the number of common characters between them.
 */
func commonCharacterCount(s1: String, s2: String) -> Int {
    var S2 = s2
    var commons = 0
    
    for ch in s1 {
        if S2.contains(ch) {
            commons += 1
            if let i = S2.firstIndex(of: ch) {
                S2.remove(at: i)
            }
        }
    }
    
    return commons
}

commonCharacterCount(s1: "zzzz", s2: "zzzzzzz")
// 4



// Mark: 11 - isLucky
/*
 Ticket numbers usually consist of an even number of digits. A ticket number is considered lucky if the sum of the first half of the digits is equal to the sum of the second half.
 */
func isLucky(n: Int) -> Bool {
    let strN = String(n)
    var firstHalf = 0
    var secondHalf = 0
    
    for (i, str) in strN.enumerated() {
        if i < strN.count/2 {
            firstHalf += Int(String(str))!
        } else {
            secondHalf += Int(String(str))!
        }
    }
    
    if firstHalf == secondHalf {
        return true
    } else {
        return false
    }
}

isLucky(n: 1234)
// true



// Mark: 12 - Sort By Height
/*
 Some people are standing in a row in a park. There are trees between them which cannot be moved. Your task is to rearrange the people by their heights in a non-descending order without moving the trees. People can be very tall!
 
 If a[i] = -1, then the ith position is occupied by a tree. Otherwise a[i] is the height of a person standing in the ith position.

 Guaranteed constraints:
 1 ≤ a.length ≤ 1000,
 -1 ≤ a[i] ≤ 1000.
 */
func sortByHeight(a: [Int]) -> [Int] {
    var A = a
    var treeIndexes = [Int]()
    
    for (i, val) in a.enumerated() {
        if val == -1 {
            treeIndexes.append(i)
        }
    }
    
    A.removeAll(where: { $0 == -1 })
    A.sort()
    
    for val in treeIndexes {
        A.insert(-1, at: val)
    }

    return A
}

sortByHeight(a: [-1, 150, 190, 170, -1, -1, 160, 180])
// [-1, 150, 160, 170, -1, -1, 180, 190]



// Mark: 13 - reverseInParentheses
/*
 Write a function that reverses characters in (possibly nested) parentheses in the input string.

 Input strings will always be well-formed with matching ()s.
 */
func reverseInParentheses(inputString: String) -> String {
    var str = inputString
    var start: String.Index?
    var end: String.Index

    while str.contains("(") {
        backToBegining :for (i,ch) in zip(str.indices, str) {
            if ch == "(" {
                start = i
                print("\(ch), \(i)")
            } else if ch == ")" {
                if start != nil {
                    end = i
                    print("\(ch), \(i)")
                    let temp1 = str[start!...end]
                    let temp2 = temp1.replacingOccurrences(of: "(", with: "_")
                    let temp3 = temp2.replacingOccurrences(of: ")", with: "_")
                    print(temp3)
                    str.replaceSubrange(start!...end, with: temp3.reversed())
                    start == nil
                    print(str)
                    break backToBegining
                }
            }
        }
    }
    str = str.replacingOccurrences(of: "_", with: "")
    print("final: \(str)")
    return str
}

reverseInParentheses(inputString: "foo(bar(baz))blim")
// "foo(bar)baz(blim)" = foorabbazmilb
// "foo(bar(baz))blim" = "foobazrabblim"

// ******************************************************************
