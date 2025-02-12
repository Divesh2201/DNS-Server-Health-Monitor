//
//  DNSMonitorViewModel.swift
//  DNS Server Health Monitor
//
//  Created by Divesh Thakker on 2/12/25.
//

import Foundation
import Network

class DNSMonitorViewModel: ObservableObject {
    @Published var serverStatuses: [DNSServerStatus] = []
    
    init() {
        // Initialize with DNS servers
        serverStatuses = [
            DNSServerStatus(server: "8.8.8.8"),
            DNSServerStatus(server: "1.1.1.1")
        ]
    }
    
    func checkServers() {
        // Simulate server checks for now
        for index in serverStatuses.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.serverStatuses[index].responseTime = Double.random(in: 10...100)
                self.serverStatuses[index].isOnline = Bool.random()
            }
        }
    }
}
