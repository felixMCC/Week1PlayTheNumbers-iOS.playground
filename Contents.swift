//: Playground - noun: a place where people can play

import UIKit

var str = "iPhone App Develoment with Swift 2.0 \nWeek1: Play The Numbers!\nNestor (Felix) Sotres"

print(str)
//1) Assign a list of unique random numbers to 5 variables and 5 constants.

//5 variables 

var random1 = 2
var random2 = 45
var random3 = 55
var random4 = 22
var random5 = 3

//5 constants

let randomConst1 = 32
let randomConst2 = 323
let randomConst3 = 35
let randomConst4 = 8
let randomConst5 = 73

//dictionaries to be used later (declared as empty to leave size mutable)
var dictionaryVar: [String: Int] = [:]
var dictionaryConst: [String: Int] = [:]

//2) Place them into an array 

var arrayVariables = [random1, random2, random3, random4, random5]
let arrayConstants = [randomConst1, randomConst2, randomConst3, randomConst4, randomConst5]

//3) Sort them into ascending order

var newArrayVar: [Int] = []    //array that will hold sorted variable values
var newArrayConst: [Int] = []  //array that will hold sorted constant values (array needs to be mutable)

/*func arraySort
*   - Takes an array, sorts values either in ascending (+) or descending (-) order, and puts them in
*       the new array that was passed into the function in the sorted order.
*   - The array that will hold the values in sorted order is passed by reference in order to mantain
*       indexing after the recursive call is made inside the function.
*/
func arraySort( var myArray : [Int], sortedMethod : String, inout newArray : [Int]) -> Void {
    //if array is empty exit out of function
    guard myArray.isEmpty == false else{
        return
    }
    
    var first = myArray[0]  //take first item from array
    var index = 0           //value holding array into index
    
    //iterate through all values and find max/min value
    for var cnt = 0; cnt < myArray.count; cnt++ {
        if sortedMethod == "+" {
            //print("Finding maximum \n")
            if myArray[cnt] < first {
                first = myArray[cnt]   //found new max
                index = cnt            //save index
            }
        }else if sortedMethod == "-" {
            //print("Finding maximum \n")
            if myArray[cnt] > first {
                first = myArray[cnt]   //found new max
                index = cnt            //save index
            }
        }else{
            return
        }
        
    }//end for
    
    //having found new value print it out
    print("\(first) ")
    newArray.append(first)              //append new value append it to new array
    myArray.removeAtIndex(index)        //remove max element from array

    //recursively call function to sort rest of values (passing array by reference)
    arraySort(myArray, sortedMethod: sortedMethod, newArray: &newArray)
    
} //end arraySort

//takes an array and prints items in it
func printArray(myArray: [Int])->Void{
    for var cnt = 0; cnt < myArray.count; cnt++ {
        print("\(myArray[cnt]) ", terminator: "")
    }
}

print("\nUsing function to sort Variable numbers in ascending order\nand set them inside new array in such order.")
arraySort(arrayVariables, sortedMethod: "+", newArray: &newArrayVar)

print("\nNew array sorted in ascending order:")
printArray(newArrayVar)

print("\n\nUsing function to sort Constant numbers in ascending order\nand set them inside new array in such order.")
arraySort(arrayConstants, sortedMethod: "+", newArray: &newArrayConst)
print("\nNew array sorted in ascending order:")
printArray(newArrayConst)


//4) Store them into a dictionary using key values for easy retrieval of the highest and lowest number.

//takes a dictionary by reference and an array. Places contents of array into the dictionary
func setDictionary(inout myDictionary: [String:Int], myArray: [Int])->Void{
    myDictionary = ["lowest": myArray[0], "2": myArray[1], "3": myArray[2], "4": myArray[3], "max": myArray[4]]
}

//takes a dictionary and prints it
func printDictionary(myDictionary: [String:Int])->Void{
    for value in myDictionary{
        print(value)
    }
}
//set new dictionaries
setDictionary(&dictionaryVar , myArray: newArrayVar)
setDictionary(&dictionaryConst, myArray: newArrayConst)
//var myDictionaryVar = ["lowest": newArrayVar[0], "2": newArrayVar[1], "3": newArrayVar[2], "4": newArrayVar[3], "max": newArrayVar[4]]

print("\n\nPrint every value in the dictionary (by default has no order) but keys should show that the sorting worked regardless")

print("\nPrinting dictionary holding Variable values")
printDictionary(dictionaryVar)

print("\nPrinting dictionary holding Constant values")
printDictionary(dictionaryConst)


