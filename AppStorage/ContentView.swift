//
//  ContentView.swift
//  AppStorage
//
//  Created by Federico on 01/03/2022.
//

import SwiftUI

struct ContentView: View {
   @AppStorage("STRING_KEY") var savedText: String = ""
   @AppStorage("NUMBER_KEY") var counter: Int = 0
   @State private var text = ""
   
   var body: some View {
      VStack {
         Text("\(counter)")
            .font(.system(size: 100, weight: .bold, design: .serif))
            .bold()
            .foregroundColor(.red)
            .onTapGesture {
               counter += 1
         }
         
         TextField("Type something", text: $text)
            .onChange(of: text) { text in
               self.savedText = text
            }
            .textFieldStyle(.roundedBorder)
            .font(.title)
            .disableAutocorrection(true)
            .onAppear {
               self.text = savedText
               print("Loaded: \(savedText)")
            }
         Spacer()
      }
      .padding()
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
