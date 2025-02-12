//
//  DNSServerStatus.swift
//  DNS Server Health Monitor
//
//  Created by Divesh Thakker on 2/12/25.
//
import Foundation


struct DNSServerStatus: Identifiable {
    let id = UUID()
    let server: String
    var responseTime: Double?
    var isOnline: Bool?
}
