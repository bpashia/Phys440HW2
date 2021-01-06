//
//  Bessel Functions.swift
//  Regular Bessel Fumciton
//
//  Created by Jeff Terry on 11/30/20.
//

import Foundation
import SwiftUI


/* Calculate Bessel functions using downward recursion */
/// calculateDownwardRecursion
/// - Parameters:
///   - xValue: x
///   - order: Order of Bessel Function
///   - start: Starting Order
///               2l
///     J       (x)  =   ------ J  (x)   -  J        (x)
///      l - 1              x       l             l + 1
///
///
func calculateDownwardRecursion (xValue: Double, order: Int, start: Int) -> Double
{
    var scale = calculateFirstBessel(xValue: xValue) /* jSub0 which we know. Used for scaling the downward recursion */
    
    var jSubl = Array(repeating: 0.0, count: start + 2) /* jSubl is an array that holds the various orders of the Bessel Function */
    
    
    jSubl[start+1] = 1.0                   // start with "guess"
    jSubl[start] = 1.0                      // start with "guess"
    
    for index in (1...start).reversed(){
        
        jSubl[index-1] = ((2.0*(Double(index)))/xValue)*jSubl[index] - jSubl[index+1]
    }
    
    scale = (scale)/jSubl[0];      /* scale the result */
    
    return(jSubl[order]*(scale))
}


/* Calculate Bessel functions using upward recursion */
/// calculateUpwardRecursion
/// - Parameters:
///   - xValue: x
///   - order: Order of Bessel Function
///                2l
///     J          (x)  =   ------  J  (x)  -  J       (x)
///       l + 1              x        l            l - 1
///
///
func calculateUpwardRecursion (xValue: Double, order: Int) -> Double
{
    var firstBessel = 0.0  /* temporary placeholders through the upward recursion */
    var secondBessel = 0.0 /* temporary placeholders through the upward recursion */
    var thirdBessel = 0.0; /* holds final Bessel Function result */
    
    
    firstBessel = calculateFirstBessel(xValue: xValue)                    /* start with lowest order */
    if (order == 0) {
        thirdBessel = firstBessel
    }
    else {
        
        secondBessel = calculateSecondBessel(xValue: xValue)
        for index in (1..<order)             /* loop for order of function */
        {
            thirdBessel = ((2.0*(Double(index)))/xValue)*secondBessel - firstBessel       // recursion relation
            firstBessel = secondBessel
            secondBessel = thirdBessel
        }
    }
    return(thirdBessel)
}



/// calculateFirstBessel
/// - Parameter xValue: x
/// - Returns: first Bessel Function
//                       _                             _
//                      |      oo             m  2 m    |
//                      |      __       ( - 1)  x       |
//     J   (x)     =    | 1 + \         ------------    |
//      0               |     /__          2m     2     |
//                      |_    m = 1      2    (m!)     _|
//
func calculateFirstBessel (xValue: Double) -> Double{
    
    var sum = 1.0
    
    for i in (1...100){
        
        let sign = (-1.0)↑Double(i)
        let xpower = xValue↑(2.0*Double(i))
        let numerator = sign * xpower
        
        let twoPower = (2.0)↑(2.0*Double(i))
        let factorial = Double(i)❗️
        let factorialSquared = Double(factorial)↑(2.0)
        let denominator = twoPower * factorialSquared
        
        
        
        sum += (numerator/denominator)
        
    }
    
    return sum
    
}


/// calculateSecondBessel
/// - Parameter xValue: x
/// - Returns: second Bessel Function
//                    oo            m  2m
//               x    __      ( - 1)  x
//     J  (x) =  -   \         -----------------
//      1        2   /__          2m
//                   m = 0      2    (m + 1)! m!
//
//
func calculateSecondBessel (xValue: Double) -> Double{
    
    var sum = 0.0
    
    for i in (0...100){
        
        let sign = (-1.0)↑Double(i)
        let xpower = xValue↑(2.0*Double(i))
        let numerator = sign * xpower
        
        let twoPower = (2.0)↑(2.0*Double(i))
        let factorialOne = Double(i)❗️
        let factorialTwo = Double(i+1)❗️
        let denominator = twoPower * factorialOne * factorialTwo
        
        
        
        sum += (numerator/denominator)
        
    }
    
    sum *= xValue/2.0
    
    return sum
    
}
