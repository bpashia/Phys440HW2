//
//  2_1_1SubtractiveCancellation.swift
//  Regular Bessel Function SwiftUI (iOS)
//
//  Created by Broc Pashia on 2/1/22.
//

import Foundation


//Calculate Roots of a, b, and c
//                        __________
//                    | / 2
//            - b pm  |/ b   -  4ac
//x1,x2  =    -----------------------
//                        2a

//                    -2c
//x1,x2  =    -----------------------
//                        __________
//                    | / 2
//            - b pm  |/ b   -  4ac



func calculateRoots(a:Double,b:Double,c:Double)->[Double]{
        //x1
    let x1 = (-1*b+sqrt(pow(b,2)-4.0*a*c))/(2*a)
        //x2
    let x2 = (-1*b-sqrt(pow(b,2)-4.0*a*c))/(2*a)
        //xprime1
    let xprime1 = (-2*c)/(b+sqrt(pow(b,2)-4.0*a*c))
        //xprime2
    let xprime2 = (-2*c)/(b-sqrt(pow(b,2)-4.0*a*c))
        
        return [x1,x2,xprime1,xprime2]
    }

//Calculate Identical Series different ways (s1, s2, s3) to show Subtractive Cancellation

//        __ 2N        n    n
//s1  =   \      ( - 1)    -----
//        /__ n = 1        n + 1


//            __ N     2n - 1      __ N       2n
//s2  =    - \         ------  +  \         ------
//           /__ n = 1   2n       /__ n = 1 2n + 1


//        __ N          1
//s3  =   \         ----------
//        /__ n = 1 2n(2n + 1)





func calculateSubtractiveCancellationSeries (n:Int)->[Double]{
    var s1 = 0.0;
    var s2 = 0.0;
    var s3 = 0.0;
    for i in (1...2*n){
        s1 += pow(-1.0,Double(i))*Double(i)/(Double(i)+1)
        if (i<=n){
        s2 += -1*(2*Double(i) - 1)/(2*Double(i)) + 2*Double(i)/(2*Double(i)+1)
        s3 += 1/(2*Double(i)*(2*Double(i)+1))
        }
    }
    return [s1,s2,s3]
}

//Do summation of series in reverse (sDown) and compare it to normal summation (sUp)

//         __ N         1
//sUp  =   \          -----
//         /__ n = 1    n

//           __ 1          1
//sDown  =   \           -----
//           /__ n = N     n

func calculateSubtractiveCancellationSUpAndSDown (n:Int)->[Double]{
    var sUp = 0.0
    var sDown = 0.0
    
    for i in (1...n){
        sUp += 1/Double(i)
        sDown += 1/Double(n-i+1)
    }
    return [sUp,sDown]
}
