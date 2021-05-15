//
//  ContentView.swift
//  UnitConversion
//
//  Created by Mattia Fasoli on 14/05/21.
//

import SwiftUI

struct ContentView: View {
    
    
    
    @State var temperatureInputValue = ""
    @State var temperatureInputType = 0
    @State var temperatureOutputType = 0
    
    let temperatureTypes = ["Celsius", "Fahrenheit", "Kelvin"]
        
    var temperatureConversion: Double {
        let temperatureValue = Double(temperatureInputValue) ?? 0
        var temperatureOutputValue = 0.0
        
        if (temperatureInputType == 0) {
            if (temperatureOutputType == 0) {
                temperatureOutputValue = Double(temperatureValue)
            } else if (temperatureOutputType == 1) {
                temperatureOutputValue = Double((temperatureValue * (9 / 5)) + 32)
            } else {
                temperatureOutputValue = Double(temperatureValue + 273.15)
            }
        } else if (temperatureInputType == 1) {
            if (temperatureOutputType == 0) {
                temperatureOutputValue = Double((temperatureValue - 32) * 5 / 9)
            } else if (temperatureOutputType == 1) {
                temperatureOutputValue = Double(temperatureValue)
            } else {
                temperatureOutputValue = Double(((temperatureValue - 32) * 5 / 9) + 273.15)
            }
        } else {
            if (temperatureOutputType == 0) {
                temperatureOutputValue = Double(temperatureValue - 273.15)
            } else if (temperatureOutputType == 1) {
                temperatureOutputValue = Double(((temperatureValue - 273.15) * 9 / 5) + 32)
            } else {
                temperatureOutputValue = Double(temperatureValue)
            }
        }
        
        return temperatureOutputValue
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Temperature", text: $temperatureInputValue)
                }
                
                Section(header: Text("Input")) {
                    Picker("Temperature Input", selection: $temperatureInputType) {
                        ForEach(0..<temperatureTypes.count) {
                            Text("\(temperatureTypes[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    //Text("\(temperatureTypes[temperatureInputType])")
                }
                
                Section(header: Text("Output")) {
                    Picker("Temperature Output", selection: $temperatureOutputType) {
                        ForEach(0..<temperatureTypes.count) {
                            Text("\(temperatureTypes[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    //Text("\(temperatureTypes[temperatureOutputType])")
                }
                
                Section {
                    
                    Text("\(temperatureConversion, specifier: "%.2f")")
                    
                }
                
            }
            .navigationBarTitle("UnitConversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
