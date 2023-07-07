//
//  User.swift
//  Mobilix
//
//  Created by Werner Mona on 04/05/2023.
//

import Foundation
import SwiftUI


enum Partener: Identifiable {
    case velov2
    case citiz
    case dott
    case zety
    case tier1
    
    var id: Self {
        self
    }
}


struct User: Identifiable {
    var id: UUID = UUID()
    var name: String
    var email: String
    var password: String
    var avator: String
    var points: Int
    var codeSponsoring: String
    var mobilityApps: [String]
}


var louise = User(name: "Louise", email: "louise@aaa.fr", password: "12345", avator: "", points: 1450, codeSponsoring: "LOUISE3029", mobilityApps: ["velov2", "tier1", "citiz", "dott", "zity"])




struct Account: Identifiable {
    var id: UUID = UUID()
    var name: String
    var logo: String
    var mobilityIcon : String
    var connected: Bool
    var markColor: Color
}

var velovAccount = Account(name: "Vélo'v", logo: "velov3", mobilityIcon: "bicycle", connected: true, markColor: .red)
var dottAccount = Account(name: "Dott", logo: "dott3", mobilityIcon: "scooter", connected: true, markColor: .black)
var tierAccount = Account(name: "Tier", logo: "tier3", mobilityIcon: "scooter", connected: false, markColor: .indigo)
var citizAccount = Account(name: "Citiz", logo: "citiz3", mobilityIcon: "car.fill", connected: true, markColor: .mint)
var zityAccount = Account(name: "Zity", logo: "zity3", mobilityIcon: "car.fill", connected: false, markColor: .green)

var louiseAccounts: [Account] = [velovAccount, dottAccount, tierAccount, citizAccount, zityAccount]
