import Foundation

// MARK: Rains Of Reason *******************************************

// Mark: 29 - chessBoardCellColor
/*
 Given two cells on the standard chess board, determine whether they have the same color or not.
 */
func chessBoardCellColor(cell1: String, cell2: String) -> Bool {
    let letters = (Int(UnicodeScalar(String(cell1.first!))!.value),
                   Int(UnicodeScalar(String(cell2.first!))!.value))
    
    let numbers = (Int(String(cell1.last!))!, Int(String(cell2.last!))!)
    
    if (letters.0 + numbers.0) % 2 == 0 && (letters.1 + numbers.1) % 2 == 0 {
        return true
    } else if (letters.0 + numbers.0) % 2 != 0 && (letters.1 + numbers.1) % 2 != 0 { return true
    } else { return false }
}

chessBoardCellColor(cell1: "E1", cell2: "F8")
// E1, F8 = true
// A1, C3 = true
// G5 ,E7 = true



// Mark: 28 - alphabeticShift
/*
 Given a string, your task is to replace each of its characters by the next one in the English alphabet; i.e. replace a with b, replace b with c, etc (z would be replaced by a).
 
 ex:
 For inputString = "crazy", the output should be alphabeticShift(inputString) = "dsbaz".
 */
func alphabeticShift(inputString: String) -> String {
    var str = inputString
    
    for (i,ch) in inputString.enumerated() {
        let uniCode = UnicodeScalar(String(ch))!
        let index = str.index(str.startIndex, offsetBy: i)
        print(uniCode)
        switch uniCode {
        case "a"..<"z":
            let next = String(UnicodeScalar(uniCode.value + 1)!)
            str.replaceSubrange(index...index, with: next)
        case "z":
            str.replaceSubrange(index...index, with: "a")
        default:
            break
        }
    }
    
    print(str)
    return str
}

alphabeticShift(inputString: "aaaabbbccd")
// "crazy" = "dsbaz"
// "aaaabbbccd" = "bbbbcccdde"



// Mark: 27 - variableName
/*
 Correct variable names consist only of English letters, digits and underscores and they can't start with a digit.

 Check if the given string is a correct variable name.
 
 ex:
 For name = "var_1__Int", the output should be
 variableName(name) = true;
 For name = "qq-q", the output should be
 variableName(name) = false;
 For name = "2w2", the output should be
 variableName(name) = false.
 */
func variableName(name: String) -> Bool {
    var correct = true
    if name.first!.isNumber { correct = false } else {
        incorrect: for ch in name {
            if !ch.isLetter && !ch.isNumber && ch != "_" {
                correct = false
                break incorrect
            }
        }
    }
    
    return correct
}

variableName(name: "2w2")
// "var_1__Int" = true
// "2w2" = false



// Mark: 26 - evenDigitsOnly
/*
 Check if all digits of the given integer are even.
 ex:
 For n = 248622, the output should be
 evenDigitsOnly(n) = true;
 For n = 642386, the output should be
 evenDigitsOnly(n) = false.
 */
func evenDigitsOnly(n: Int) -> Bool {
    let str = String(n)
    for char in str {
        guard let ch = Int.init(String(char)) else { return false }
        if ch % 2 != 0 { return false }
    }
    
    return true
}

evenDigitsOnly(n: 2462487)
// 248622 = true
// 2462487 = false



// Mark: 25 - ArrayReplace
/*
 Given an array of integers, replace all the occurrences of elemToReplace with substitutionElem.

 For inputArray = [1, 2, 1], elemToReplace = 1, and substitutionElem = 3, the output should be
 arrayReplace(inputArray, elemToReplace, substitutionElem) = [3, 2, 3].
 */
func arrayReplace(inputArray: [Int], elemToReplace: Int, substitutionElem: Int) -> [Int] {
    var arr = inputArray
    for (i, val) in inputArray.enumerated() {
        if val == elemToReplace {
            arr[i] = substitutionElem
        }
    }
    
    return arr
}

arrayReplace(inputArray: [1, 2, 1], elemToReplace: 1, substitutionElem: 3)
// [3, 2, 3]

// *********************************************************************

