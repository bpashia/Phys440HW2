//
//  Neumann Functions.swift
//  Regular Bessel Function SwiftUI (iOS)
//
//  Created by Broc Pashia on 1/28/22.
//

import Foundation
import SwiftUI

//calculate first bessel function of the inputted value x

//          sin(x)
//     ---------------
//             x

func calculateBesselOrderZero(x:Double)->Double{
    let result = sin(x)/x
    return result
}

//calculate second bessel function of the inputted value x

//          sin(x)                  cos(x)
//     ---------------     -     -------------
//              2                      x
//            x

func calculateBesselOrderOne(x:Double)->Double{
    let result = sin(x)/(pow(x,2)) - cos(x)/x
    return result
}

//Calculate Bessel Functions using upward recursion

//Parameters:
//    x:  value of function
//order:  Order of the bessel to calculate

//               2l + 1
// jl + 1(x)  =   ------jl(x)  -  jl - 1(x)
//                 x



func calculateBesselUpwardRecursion(x:Double, order: Int)->Double{
    print(order)
    if (order == 0){
        return calculateBesselOrderZero(x:x)
    } else if (order == 1){
        return calculateBesselOrderOne(x:x)
    } else {
        let upwardRecursionResult = ((2.0*Double(order)-1)/x)*calculateBesselUpwardRecursion(x:x, order:order-1)-calculateBesselUpwardRecursion(x:x, order:order-2)
        
        return upwardRecursionResult
    }
    
}

//Calculate Bessel Functions using downward recursion

//               2l + 1
//jl - 1(x)  =   ------jl(x)  -  jl + 1(x)
//                 x

//Parameters:
//    x:  value of function
//order:  Order of the bessel to calculate
//start:  Bessel to start recurring backwards from


func calculateBesselDownwardRecursion(x:Double, order: Int,start:Int)->Double{
    var valuesOfPreviousOrders = [1.0,1.0]
    for _ in (0...start){
        let arrayLength = valuesOfPreviousOrders.endIndex
        let nextBesselValue = ((2.0*Double(start-(arrayLength-1))+1)/x)*valuesOfPreviousOrders[arrayLength-1]-valuesOfPreviousOrders[arrayLength-2]
        valuesOfPreviousOrders.append(nextBesselValue)
    }
    let scale = calculateBesselOrderZero(x: x)/valuesOfPreviousOrders[start]

    let calculatedBesselValue = valuesOfPreviousOrders[start-order]*scale
    return calculatedBesselValue
    
}

