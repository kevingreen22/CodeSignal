import UIKit

// MARK - The Journey Begins ****************************************************

// Mark: 3 - checkPalindrome
/*
 Given the string, check if it is a palindrome.
 */
func isPalindrome(param1: String, param2: String) -> Bool {
    var pal = ""
    let low = param1.lowercased()
    
    for i in low.reversed() {
        pal.append(i)
    }
    return low == pal
}

isPalindrome(param1: "Bob", param2: "bob")
// true



// Mark: 2 - centuryFromYear
/*
 Given a year, return the century it is in. The first century spans from the year 1 up to and including the year 100, the second - from the year 101 up to and including the year 200, etc.
 */
func centuryFromYear(year: Int) -> Int {
    let temp = (year + 99) / 100
    return temp
}

centuryFromYear(year: 1905)
// 20



// Mark: 1 - add
/*
 Write a function that returns the sum of two numbers.
 */
func add(param1: Int, param2: Int) -> Int {
    let sum = param1 + param2
    return sum
}

add(param1: 1, param2: 2)
// 3

//  *****************************************************************************

