import Foundation

// MARK - Intro Gates **********************************************************


// Mark:
/*
 Some phone usage rate may be described as follows:
 
 first minute of a call costs min1 cents,
 each minute from the 2nd up to 10th (inclusive) costs min2_10 cents
 each minute after 10th costs min11 cents.
 
 You have s cents on your account before the call. What is the duration of the longest call (in minutes rounded down to the nearest integer) you can have?
 */
func phoneCall(min1: Int, min2_10: Int, min11: Int, s: Int) -> Int {
    var cents = s
    var totalMin = 0
    var count = 0
    
    // first min
    if cents > 0 && cents >= min1 {
        cents -= min1
        totalMin += 1
    }
    
    // second min
    for _ in 2...10 {
        if cents > 0 && cents >= min2_10 {
            cents -= min2_10
            totalMin += 1
            count += 1
        }
    }
    
    // every min after 10
    while cents > 0 && cents >= min11 && count == 9 {
        cents -= min11
        totalMin += 1
    }
    
    return totalMin
}

phoneCall(min1: 10, min2_10: 1, min11: 2, s: 22)
// 11



// Mark:
/*
 One night you go for a ride on your motorcycle. At 00:00 you start your engine, and the built-in timer automatically begins counting the length of your ride, in minutes. Off you go to explore the neighborhood.

 When you finally decide to head back, you realize there's a chance the bridges on your route home are up, leaving you stranded! Unfortunately, you don't have your watch on you and don't know what time it is. All you know thanks to the bike's timer is that n minutes have passed since 00:00.

 Using the bike's timer, calculate the current time. Return an answer as the sum of digits that the digital timer in the format hh:mm would show.
 */
func lateRide(n: Int) -> Int {
    var digitSum = 0
    let (q, r) = n.quotientAndRemainder(dividingBy: 60)
    let str = String(q) + String(r)
    
    for i in str {
        digitSum += i.wholeNumberValue!
    }
    
    return digitSum
}

lateRide(n: 240)
// 4



// Mark:
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

circleOfNumbers(n: 6, firstNumber: 3)
// 0



// Mark:
/*
 Given a divisor and a bound, find the largest integer N such that:

 N is divisible by divisor.
 N is less than or equal to bound.
 N is greater than 0.
 It is guaranteed that such a number exists.
 */
func maxMultiple(divisor: Int, bound: Int) -> Int {
    var largestDiv = 0
    
    done: for i in (0...bound).reversed() {
        print(i)
        if i % divisor == 0 {
            largestDiv = i
            break done
        }
    }
    
    return largestDiv
}

maxMultiple(divisor: 3, bound: 10)
// 9



// Mark:
/*
 Your friend advised you to see a new performance in the most popular theater in the city. He knows a lot about art and his advice is usually good, but not this time: the performance turned out to be awfully dull. It's so bad you want to sneak out, which is quite simple, especially since the exit is located right behind your row to the left. All you need to do is climb over your seat and make your way to the exit.

 The main problem is your shyness: you're afraid that you'll end up blocking the view (even if only for a couple of seconds) of all the people who sit behind you and in your column or the columns to your left. To gain some courage, you decide to calculate the number of such people and see if you can possibly make it to the exit without disturbing too many people.

 Given the total number of rows and columns in the theater (nRows and nCols, respectively), and the row and column you're sitting in, return the number of people who sit strictly behind you and in your column or to the left, assuming all seats are occupied.
 */
func seatsInTheater(nCols: Int, nRows: Int, col: Int, row: Int) -> Int {
    let cols = nCols - (col-1)
    let rows = nRows - row
    return cols * rows
}

seatsInTheater(nCols: 16, nRows: 11, col: 5, row: 3)
// 96



// Mark:
/*
 n children have got m pieces of candy. They want to eat as much candy as they can, but each child must eat exactly the same amount of candy as any other child. Determine how many pieces of candy will be eaten by all the children together. Individual pieces of candy cannot be split.
 */
func candies(n: Int, m: Int) -> Int {
    if m % n == 0 {
        return m
    } else {
        return m - (m % n)
    }
}

candies(n: 3, m: 10)
// 9



// Mark:
/*
 Given an integer n, return the largest number that contains exactly n digits.
 */
func largestNumber(n: Int) -> Int {
    var largest: String = ""
    
    for _ in 1...n {
        largest.append("9")
    }
    
    return Int(largest)!
}

largestNumber(n: 2)
// 99



// Mark:
/*
 You are given a two-digit integer n. Return the sum of its digits.
 */
func addTwoDigigs(n: Int) -> Int {
    var total: Int = 0
    let nStr: String = String(n)
    
    for (_, val) in nStr.enumerated() {
        total += Int(String(val))!
    }
    
    return total
}

addTwoDigigs(n: 29)
// 11

// ******************************************************************************

