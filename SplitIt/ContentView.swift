//
//  ContentView.swift
//  SplitIt
//
//  Created by Ryan Matsuo on 4/14/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTemp = ""
    @State private var inputUnit = 0
    @State private var targetUnit = 0
    
    let units = ["Fahrenheit", "Celcius", "Kelvin"]
    
    var baseTemp: Double {
        let enteredTemp = Double(inputTemp) ?? 0
        switch inputUnit {
        case 0:
            let tempConvertToF = enteredTemp
            return tempConvertToF
        case 1:
            let tempConvertToF = (enteredTemp * (9/5) + 32)
            return tempConvertToF
        case 2:
            let tempConvertToF = (enteredTemp - 273.15) * (9/5) + 32
            return tempConvertToF
        default:
            let tempConvertToF = 0
            return Double(tempConvertToF)
        }
    }
    
    var convertedTemp: Double {
        switch targetUnit {
        case 0:
            return baseTemp
        case 1:
            let finalTemp = (baseTemp - 32) * (5/9)
            return finalTemp
        case 2:
            let finalTemp = (baseTemp - 32) * (5/9) + 273.15
            return finalTemp
        default:
            return baseTemp
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Convert from:")) {
                    TextField("Enter temperature", text: $inputTemp)
                    Picker("Input Units", selection: $inputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Convert to:")) {
                    Picker("Target Units", selection: $targetUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Converted Temperature")) {
                    Text("\(convertedTemp, specifier: "%.1f")")
                }
                
            }
            .navigationTitle("Temp Converter")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
