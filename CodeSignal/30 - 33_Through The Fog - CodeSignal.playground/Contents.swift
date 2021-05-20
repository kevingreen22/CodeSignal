import Foundation

// MARK: Through The Fog *************************************************


// Mark: 33 - stringsRearrangment
/*
 Given an array of equal-length strings, you'd like to know if it's possible to rearrange the order of the elements in such a way that each consecutive pair of strings differ by exactly one character. Return true if it's possible, and false if not.

 Note: You're only rearranging the order of the strings, not the order of the letters within the strings!
 ex:
 For inputArray = ["aba", "bbb", "bab"], the output should be
 stringsRearrangement(inputArray) = false.

 There are 6 possible arrangements for these strings:
 ["aba", "bbb", "bab"]
 ["aba", "bab", "bbb"]
 ["bbb", "aba", "bab"]
 ["bbb", "bab", "aba"]
 ["bab", "bbb", "aba"]
 ["bab", "aba", "bbb"]
 None of these satisfy the condition of consecutive strings differing by 1 character, so the answer is false.
 */
func stringsRearrangement(inputArray: [String]) -> Bool {
    var rea = true
    var diffCount = [Int]()
    var count = 0
    let sort = inputArray.sorted()
    
    for (i,str) in sort.enumerated() {
        print("i: \(i)")
        if i < str.count-1 {
            let one = sort[i]
            print(one)
            let two = sort[i+1]
            print(two)
            for j in one.indices {
                if one[j] != two[j] {
                    print("j: \(j)")
                    print("one: \(one[j]) - two: \(two[j])")
                    count += 1
                    diffCount.append(count)
                }
            }
            count = 0
        }
    }
    
    print("diffCount: \(diffCount)")
    let diff = diffCount.map({
        $0 > 1
    })
    for d in diff {
        if d == true {
            rea = false
        }
    }
    
    return rea
}

stringsRearrangement(inputArray: ["aba", "bbb", "bab"])
// ["aba", "bbb", "bab"] = false
// ["ab", "bb", "aa"] = true


// Mark: 32 - absoluteValuesSumMinimization
/*
 Given a sorted array of integers a, your task is to determine which element of a is closest to all other values of a. In other words, find the element x in a, which minimizes the following sum:

 abs(a[0] - x) + abs(a[1] - x) + ... + abs(a[a.length - 1] - x)
 (where abs denotes the absolute value)

 If there are several possible answers, output the smallest one.
 */
func absoluteValuesSumMinimization(a: [Int]) -> Int {
    var map = [Int]()
    var acum = 0
    
    for val in a {
        for v in a {
            acum += abs(v - val)
        }
        map.append(acum)
        acum = 0
    }
    
    return a[map.firstIndex(of: map.min()!)!]
}

absoluteValuesSumMinimization(a: [2,4,7])
// [2,4,7] = 4



// Mark: 31 - depositProfit
/*
 You have deposited a specific amount of money into your bank account. Each year your balance increases at the same growth rate. With the assumption that you don't make any additional deposits, find out how long it would take for your balance to pass a specific threshold.
 ex:
 For deposit = 100, rate = 20, and threshold = 170, the output should be
 depositProfit(deposit, rate, threshold) = 3.

 Each year the amount of money in your account increases by 20%. So throughout the years, your balance would be:

 year 0: 100;
 year 1: 120;
 year 2: 144;
 year 3: 172.8.
 Thus, it will take 3 years for your balance to pass the threshold, so the answer is 3.
 */
func depositProfit(deposit: Int, rate: Int, threshold: Int) -> Int {
    var years = 0
    let decimal = Double(rate) * 0.01
    var growth = 0.0
    var accrued = Double(deposit)
        
    while Int(accrued) < threshold {
        growth = accrued * decimal
        accrued += growth
        print(accrued)
        years += 1
    }
    return years
}

depositProfit(deposit: 100, rate: 20, threshold: 170)
// 100, 20, 170 = 3




// Mark: 30 - Circle Of Numbers
/*
 Consider integer numbers from 0 to n - 1 written down along the circle in such a way that the distance between any two neighboring numbers is equal (note that 0 and n - 1 are neighboring, too).

 Given n and firstNumber, find the number which is written in the radially opposite position to firstNumber.

 */
func circleOfNumbers(n: Int, firstNumber: Int) -> Int {
    var rad: Int!
    let mid = (n/2)
    if firstNumber > mid {
        rad = mid - (n - firstNumber)
    } else {
        rad = mid + firstNumber
    }
   
    if rad == n {
        return 0
    } else {
        return rad
    }
}

circleOfNumbers(n: 10, firstNumber: 7)
// 10, 2 = 7
// 10, 7 = 2





// ***********************************************************************
