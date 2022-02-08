//
//  Tests_macOS.swift
//  Tests macOS
//
//  Created by Jeff Terry on 1/5/21.
//

import XCTest

class Tests_macOS: XCTestCase {

    
    func testBesselOrderTwo() {
       
        
        let xValue = 3.14159
        var testValue = 0.0
        let exactValue = -0.304241422390334070012314231310288833541605096519723554605
        
        testValue = calculateBesselOrderTwo(xValue: xValue)
        
        
        XCTAssertEqual(testValue, exactValue, accuracy: 1.0e-8, "Not in margin of error")
        
        
    
    }
    
    func testBesselOrderOne() {
        
        
        let xValue = 3.14159
        var testValue = 0.0
        let exactValue = 0.2846163909175278108223286455901279738072008398586234609975
        
        testValue = calculateBesselOrderOne(xValue: xValue)
        
        
        XCTAssertEqual(testValue, exactValue, accuracy: 1.0e-8, Not in margin of error")
    }
    
    func testDownardRecursionBessel() {

        
        let xValue = 3.14159
        var testValue = 0.0
        
        let order = 12                      /* order of Bessel function */
        let start = order+25                      /* used for downward algorithm */
        
        let exactValue = 3.8913453282141163022864104025060178271079663348975737E-7
        
        
        
        testValue = calculateBesselDownwardRecursion(xValue: xValue, order: order, start: start)
        
        
        XCTAssertEqual(testValue, exactValue, accuracy: 1.0e-15, "Not in margin of error")
    
    }
                       
    func testCalculateRoots(){
            let a = 1
            let b = 2
            let c = 1
            
            let expectedResult = -1
            
            let calcualtedResult = calculateRoots(a:a,b:b,c:c)
            
            for i in calculatedResult{
                XCTAssertEqual(i, expectedResult, accuracy: 1.0e-2, "Not in margin of error")
            }
            
            
        }
                       
                       
                      

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
