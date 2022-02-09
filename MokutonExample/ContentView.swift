//
//  ContentView.swift
//  MokutonExample
//
//  Created by Christianto Budisaputra on 09/02/22.
//

import SwiftUI
import Mokuton

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Spacer()
            MKButton(title: "Yes") {
                print("LOL")
            }.withShadow()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
