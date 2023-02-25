//
//  ContentView.swift
//  QuadraticSolver
//  Starter project code
//  Created by Pasindu Akalpa on 09/02/2023.
//

import SwiftUI


struct ContentView: View {
    @AppStorage("aOld") var aOld: String = ""
    @AppStorage("bOld") var bOld: String = ""
    @AppStorage("cOld") var cOld: String = ""
    @State private var a: String = ""
    @State private var b: String = ""
    @State private var c: String = ""
    @State private var x1: String = "0.0"
    @State private var x2: String = "0.0"
    
    //state vars for a,b,c,x1, and x2
    //data persistence
    var body: some View {
        ScrollView {
            VStack {
                Text("Quadratic Solver")
                    .font(.system(size: 40))
                    .padding(.top)
                Text("The quadratic formula is:")
                    .padding(.vertical, 10)
                Image("quadraticForm")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Group {
                    HStack {
                        Image(systemName: "a.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.vertical)
                        Text("Enter the first term")
                            .font(.system(size: 30))
                    }
                    TextField("1.0", text: $a)
                        .onChange(of: a) { value in
                            aOld = value
                        }
                        .frame(height: 60)
                        .multilineTextAlignment(.center)
                        .border(.black, width: 3)
                        .padding(.horizontal)
                        .keyboardType(.decimalPad)
                        .onAppear {
                            a = aOld
                        }
                    HStack {
                        Image(systemName: "b.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.vertical)
                        Text("Enter the first term")
                            .font(.system(size: 30))
                    }
                    TextField("1.0", text: $b)
                        .onChange(of: b) { value in
                            bOld = value
                        }
                        .frame(height: 60)
                        .multilineTextAlignment(.center)
                        .border(.black, width: 3)
                        .padding(.horizontal)
                        .keyboardType(.decimalPad)
                        .onAppear {
                            b = bOld
                        }
                    HStack {
                        Image(systemName: "c.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.vertical)
                        Text("Enter the first term")
                            .font(.system(size: 30))
                    }
                    TextField("1.0", text: $c)
                        .onChange(of: c) { value in
                            cOld = value
                        }
                        .frame(height: 60)
                        .multilineTextAlignment(.center)
                        .border(.black, width: 3)
                        .padding(.horizontal)
                        .keyboardType(.decimalPad)
                        .onAppear {
                            c = cOld
                        }
                }
                Button {
                    solveForX()
                } label: {
                    Text("Solve for x")
                }
                .padding(.top, 30)
                HStack {
                    Text("x = \(x1) x = \(x2)")
                        .padding(.all)
                }
            }
        }
    }
    func solveForX()
    {
        var aValue: Double = 0
        var bValue: Double = 0
        var cValue: Double = 0
        var x1Value: Double = 0
        var x2Value: Double = 0
        
        if let aDouble = Double(a) {
            aValue = aDouble
        }
        
        if let bDouble = Double(b) {
            bValue = bDouble
        }
        
        if let cDouble = Double(c) {
            cValue = cDouble
        }
        
        x1Value = (-bValue + sqrt(pow(bValue, 2) - (4 * aValue * cValue))) / (2 * aValue)
        x2Value = (-bValue - sqrt(pow(bValue, 2) - (4 * aValue * cValue))) / (2 * aValue)
        
        x1 = String(format: "%.2f", x1Value)
        x2 = String(format: "%.2f", x2Value)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
