//
//  ContentView.swift
//  QuadraticSolver
//  Starter project code
//  Created by Pasindu Akalpa on 09/02/2023.
//  Email `pasindu.20200608@iit.ac.lk`
//

import SwiftUI


struct ContentView: View {
    @AppStorage(Constants.firstTerm)  private var a: String = ""
    @AppStorage(Constants.secondTerm)  private var b: String = ""
    @AppStorage(Constants.thirdTerm)  private var c: String = ""
    @State private var x1: String = "0.0"
    @State private var x2: String = "0.0"
    
    //state vars for a,b,c,x1, and x2
    //data persistence
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Quadratic Solver")
                    .font(.system(size: 40))
                    .padding(.top)
                Text("The quadratic formula is:")
                    .padding(.vertical, 10)
                Image("quadraticForm")
                    .resizable()
                    .scaledToFit()
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
                            a = value
                        }
                        .frame(height: 60)
                        .multilineTextAlignment(.center)
                        .border(.black, width: 3)
                        .padding(.horizontal)
                        .keyboardType(.decimalPad)
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
                            b = value
                        }
                        .frame(height: 60)
                        .multilineTextAlignment(.center)
                        .border(.black, width: 3)
                        .padding(.horizontal)
                        .keyboardType(.decimalPad)
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
                            c = value
                        }
                        .frame(height: 60)
                        .multilineTextAlignment(.center)
                        .border(.black, width: 3)
                        .padding(.horizontal)
                        .keyboardType(.decimalPad)
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
        var x1Value: Double = 0
        var x2Value: Double = 0
        
        guard let aValue = Double(a),
              let bValue = Double(b),
              let cValue = Double(c) else {
            return
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
