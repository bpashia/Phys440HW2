//
//  ContentView.swift
//  Shared
//
//  Created by Jeff Terry on 1/5/21.
//

import SwiftUI

struct ContentView: View {
    @State var guess = ""
    
    private var intFormatter: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        return f
    }()
    
    var body: some View {
    
       VStack {
            VStack {
                
                VStack {
                    Button("Subtractive Cancellation", action: subtractiveCancellationProblems)

                Button("Calculate Bessel Functions", action: calculateBesselFunc)
                    Button("Sin Problem", action: sinSeriesProblem)
                    

                    }
            .frame(minHeight: 300, maxHeight: 800)
            .frame(minWidth: 480, maxWidth: 600)
            .padding()
                TextEditor(text: $guess)

                
                
    
}
        
        
        }
        
    }
    
    func calculateBesselFunc()  {

//    let xmax = 16.0                     /* max of x  */
//    let xmin = 0.1                     /* min of x >0  */
//    let step = 0.1                      /* delta x  */
                         /* order of Bessel function */
//    let start = order+25                      /* used for downward algorithm */
    
//    var maxIndex = 0
        for i in (1...25){
    guess += String(format: "J%d(x)\n", i)
//    maxIndex = Int(((xmax-xmin)/step))+1

//    for index in (0...maxIndex)
//    {
//        x = Double(index)*step + xmin
//
//        guess += String(format: "x = %f, Downward, %7.5e, Upward, %7.5e\n", x, calculateBesselDownwardRecursion(x: x, order: order),   calculateBesselUpwardRecursion(x: x, order: order))
//
//    }
            var upwardBessel = calculateBesselUpwardRecursion(x: 0.1, order: i)
            var downwardBessel = calculateBesselDownwardRecursion(x: 0.1, order: i,start: i+25)
            guess += String(format: "x = %f, Upper, %7.5e, Lower, %7.5e, Error, %7.5e\n", 0.1, upwardBessel,downwardBessel, abs(downwardBessel-upwardBessel)/(downwardBessel+upwardBessel) )
            upwardBessel = calculateBesselUpwardRecursion(x: 1.0, order: i)
            downwardBessel = calculateBesselDownwardRecursion(x: 1.0, order: i,start: i+25)
            guess += String(format: "x = %f, Upper, %7.5e, Lower, %7.5e, Error, %7.5e\n", 1.0, upwardBessel,downwardBessel, abs(downwardBessel-upwardBessel)/(downwardBessel+upwardBessel) )
            upwardBessel = calculateBesselUpwardRecursion(x: 10.0, order: i)
            downwardBessel = calculateBesselDownwardRecursion(x: 10.0, order: i,start: i+25)
            guess += String(format: "x = %f, Upper, %7.5e, Lower, %7.5e, Error, %7.5e\n", 10.0, upwardBessel,downwardBessel, abs(downwardBessel-upwardBessel)/(downwardBessel+upwardBessel) )
            guess += String("--------------------------------------\n")

    }
    }

    func subtractiveCancellationProblems() {
        guess = ""
        guess += "Problem One: \n"
//        plotDataModel!.zeroData()
//        plotDataModel!.changingPlotParameters.yMax = 1.5
//                    plotDataModel!.changingPlotParameters.yMin = -1.5
//                    plotDataModel!.changingPlotParameters.xMax = 50
//                    plotDataModel!.changingPlotParameters.xMin = -1.0
//                    plotDataModel!.changingPlotParameters.xMax = 50
//                    plotDataModel!.changingPlotParameters.xLabel = "logN"
//                    plotDataModel!.changingPlotParameters.yLabel = "Error"
//                    plotDataModel!.changingPlotParameters.lineColor = .red()
//                    plotDataModel!.changingPlotParameters.title = "Error vs LogN"
        for i in (1...5){
            guess+=String(format: "a = %f, b = %f, c = %7.5e \n", 1.0, 1.0,pow(10.0,-1.0*Double(i)))
            
            let calculatedRoots = calculateRoots(a:1.0, b:1.0,c: pow(10.0,-1.0*Double(i)))
            
            guess += String(format:"x1 = %7.5e, x2 = %7.5e, x'1 = %7.5e, x'2 = %7.5e \n", calculatedRoots[0],calculatedRoots[1],calculatedRoots[2], calculatedRoots[3])
        }
//        for N in (1...1000000){
//            let sSeriesResults = calculateSubtractiveCancellationSeries(N)
//            let error = abs((sSeriesResults[0]-sSeriesResults[2])/sSeriesResults[2])
//            plotDataModel!.appendData(log(N)/log(10), error)
//        }
        //Problem Two: Working calculations but I don't know how to use this Plotting.xctemplate. Could we get a demo if you want us to use this in the future?
        
    }
    func sinSeriesProblem(){
        guess = ""
        let sinXSeries = seriesVersionOfSin(x:3*Double.pi)
        let sinXBuiltIn = sin(3*Double.pi)
        guess += ("Problem Three: \n")
        guess += String(format: "x: 3*pi, sin(x) Series: %7.5e, sin(x) BuiltIn: %7.5e\n", sinXSeries, sinXBuiltIn)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
