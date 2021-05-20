import UIKit

/*
 
 */
func largestAdjacent(inputArray: [Int]) -> Int {
    var temp = 0
    var previous = 0
    var largest = -255
    
    for (i, j) in inputArray.enumerated() {
        if i > 0 {
            previous = inputArray[i - 1]
            temp = j * previous
            print(temp)
            
            if temp > largest {
                largest = temp
            }
            temp -= previous
        }
    }
    return largest
}

largestAdjacent(inputArray: [-23, 4, -3, 8, -12])
//




// MARK - At The Crossroads *****************************************************

// UNFINISHED
/*
 In tennis, the winner of a set is based on how many games each player wins. The first player to win 6 games is declared the winner unless their opponent had already won 5 games, in which case the set continues until one of the players has won 7 games.

 Given two integers score1 and score2, your task is to determine if it is possible for a tennis set to be finished with a final score of score1 : score2.
 */
func tennisSet(score1: Int, score2: Int) -> Bool {
    var isSet = false

    // player won by reaching 6 wins before apponent got 5 games
    if max(score1, score2) == 6 && min(score1, score2) <= 4 { isSet = true }
    
    // player won by 2 with 7 victories OR both players were at 5 wins, then one player reaches 7 for the win (includes loser with 6 wins.)
    if max(score1, score2) == 7 && (min(score1, score2) == 5 || min(score1, score2) == 6) { isSet = true }
    
    // match went beyond 7 total games and winner must win by 2 games
    if max(score1, score2) > 7 && abs(score1 - score2) == 2 { isSet = true }
    
    return isSet
}

tennisSet(score1: 6, score2: 3)
// true



/*
 Consider an arithmetic expression of the form a#b=c. Check whether it is possible to replace # with one of the four signs: +, -, * or / to obtain a correct expression.
 */
func arithmeticExpression(a: Int, b: Int, c: Int) -> Bool {
    var ariExp = false
    
    if a+b==c {
        ariExp = true
    }
    
    if a-b==c {
        ariExp = true
    }
    
    if a*b==c {
        ariExp = true
    }
    
    if a%b == 0 && a/b==c {
        ariExp = true
    }
    
    return ariExp
}

arithmeticExpression(a: 2, b: 3, c: 5)
// true


/*
 Given integers a and b, determine whether the following pseudocode results in an infinite loop.

 while a is not equal to b do
   increase a by 1
   decrease b by 1
 Assume that the program is executed on a virtual machine which can store arbitrary long numbers and execute forever.
 */
func isInfiniteProcess(a: Int, b: Int) -> Bool {
    var infinite = true
    
    if (a < b && (abs(a-b)%2) == 0) || a == b {
        infinite = false
    }
    
    return infinite
}

isInfiniteProcess(a: 10, b: 0)
// true



/*
 You're given three integers, a, b and c. It is guaranteed that two of these integers are equal to each other. What is the value of the third integer?
 */
func extraNumber(a: Int, b: Int, c: Int) -> Int {
    var extra = 0
    
    if a == b {
        extra = c
    } else if b == c {
        extra = a
    } else if a == c {
        extra = b
    }
    return extra
}

extraNumber(a: 2, b: 7, c: 2)
// 7



/*
 You found two items in a treasure chest! The first item weighs weight1 and is worth value1, and the second item weighs weight2 and is worth value2. What is the total maximum value of the items you can take with you, assuming that your max weight capacity is maxW and you can't come back for the items later?

Note that there are only two items and you can't bring more than one item of each type, i.e. you can't take two first items or two second items.
 */
func knapsackLight(value1: Int, weight1: Int, value2: Int, weight2: Int, maxW: Int) -> Int {
    var maxValue = 0
        
        if value1 >= value2 && weight1 <= maxW {
            maxValue += value1
            if weight1 + weight2 <= maxW {
                maxValue += value2
            }
            
        } else if value2 >= value1 && weight2 <= maxW {
            maxValue += value2
            if weight2 + weight1 <= maxW {
                maxValue += value1
            }
        } else if weight1 <= maxW {
            maxValue += value1
        } else if weight2 <= maxW {
            maxValue += value2
        }
        
        return maxValue
}

knapsackLight(value1: 15, weight1: 2, value2: 20, weight2: 3, maxW: 2)
// expected: 15



/*
 You are playing an RPG game. Currently your experience points (XP) total is equal to experience. To reach the next level your XP should be at least at threshold. If you kill the monster in front of you, you will gain more experience points in the amount of the reward.

 Given values experience, threshold and reward, check if you reach the next level after killing the monster.
 */
func reachNextLevel(experience: Int, threshold: Int, reward: Int) -> Bool {
    if experience + reward >= threshold {
        return true
    } else {
        return false
    }
}

reachNextLevel(experience: 10, threshold: 15, reward: 5)
// true

// ******************************************************************************








