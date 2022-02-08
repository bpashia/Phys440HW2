//
//  2_3SinApproximation.swift
//  Regular Bessel Function SwiftUI (iOS)
//
//  Created by Broc Pashia on 2/1/22.
//

import Foundation

//Calculate the summation series version of sinx until the series term is negligible in comparison

//                            n - 1  2n - 1
//            __ N      ( - 1)      x
//sin(x)  =   \          -------------------
//            /__ n = 1       (2n - 1)!



func seriesVersionOfSin(x:Double)->Double{
    var prevSinx = 0.0
    var sinx = 0.0
    var i = 1.0
    
    while(sinx>0 && prevSinx>0 && prevSinx/sinx>=pow(10.0,-7)){
        prevSinx = sinx
        sinx = pow(-1.0, i-1.0)*pow(x,2*i-1)/((2*i-1)❗️)
        i+=1
    }
    print(String(format: "Ran %f times", i))
    return sinx
}
