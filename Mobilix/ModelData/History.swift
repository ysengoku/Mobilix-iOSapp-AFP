//
//  History.swift
//  Mobilix
//
//  Created by Werner Mona on 04/05/2023.
//

import Foundation
import SwiftUI

enum Mobility: String, Identifiable {
    case bicycle
    case scooter
    case car
    case all
    
    var id: Self {
        self
    }

/*
    var mobilityType: String {
        switch self {
        case .bicycle: return "Vélo"
        case .scooter: return "Trottinette"
        case .car: return "Voiture"
        }
    }
 */
}

struct History: Identifiable {
    var id: UUID = UUID()
    var date: String
    var name: String
    var type: Mobility
    var points: Int
    var logo : String
    var icon : String
}

var history1 = History(date: "30/04/2023", name: "Vélo'v", type: Mobility.bicycle, points: 15, logo: "velov3", icon: "bicycle")
var history2 = History(date: "15/04/2023", name: "Dott", type: Mobility.scooter, points: 20, logo: "dott3", icon: "scooter")
var history3 = History(date: "07/04/2023", name: "Citiz", type: Mobility.car, points: 25, logo: "citiz3", icon: "car.fill")
var history4 = History(date: "23/03/2023", name: "Dott", type: Mobility.scooter, points: 20, logo: "dott3", icon: "scooter")
var history5 = History(date: "16/03/2023", name: "Vélo'v", type: Mobility.bicycle, points: 15, logo: "velov3", icon: "bicycle")
var history6 = History(date: "01/03/2023", name: "Vélo'v", type: Mobility.bicycle, points: 15, logo: "velov3", icon: "bicycle")
var history7 = History(date: "21/02/2023", name: "Citiz", type: Mobility.car, points: 25, logo: "citiz3", icon: "car.fill")
var history8 = History(date: "14/02/2023", name: "Citiz", type: Mobility.car, points: 25, logo: "citiz3", icon: "car.fill")
var history9 = History(date: "20/01/2023", name: "Dott", type: Mobility.scooter, points: 20, logo: "dott3", icon: "scooter")
var history10 = History(date: "31/12/2022", name: "Citiz", type: Mobility.car, points: 25, logo: "citiz3", icon: "car.fill")

var historylist: [History] = [history1, history2, history3, history4, history5, history6, history7, history8, history9, history10]
