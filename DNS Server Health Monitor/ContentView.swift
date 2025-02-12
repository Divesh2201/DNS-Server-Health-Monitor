//
//  ContentView.swift
//  DNS Server Health Monitor
//
//  Created by Divesh Thakker on 2/12/25.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}


struct ContentView: View {
    @StateObject private var viewModel = DNSMonitorViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.serverStatuses) { status in
                HStack {
                    VStack(alignment: .leading) {
                        Text(status.server)
                            .font(.headline)
                        if let responseTime = status.responseTime {
                            Text("\(responseTime, specifier: "%.1f") ms")
                                .font(.subheadline)
                        }
                    }
                    Spacer()
                    if let isOnline = status.isOnline {
                        Image(systemName: isOnline ? "checkmark.circle.fill" : "x.circle.fill")
                            .foregroundColor(isOnline ? .green : .red)
                    } else {
                        ProgressView()
                    }
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("DNS Monitor")
            .toolbar {
                Button("Check") {
                    viewModel.checkServers()
                }
            }
        }
        .onAppear {
            viewModel.checkServers()
        }
    }
}
