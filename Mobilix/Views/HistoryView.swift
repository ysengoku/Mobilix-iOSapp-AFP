//
//  HistoryView.swift
//  Mobilix
//
//  Created by Werner Mona on 03/05/2023.
//

import SwiftUI

struct HistoryView: View {
    
    @State var userName: String = louise.name
    @State var userPoints: Int = louise.points
    
    var listHistory: [History] = historylist
    
    @State var filterdHistory: [History] = historylist
    @State private var filterValueIndex = 0
    @State private var filterValues: [Mobility] = [Mobility.all, Mobility.bicycle, Mobility.scooter, Mobility.car]
    @State private var filterChoices: [String] = ["line.3.horizontal", "bicycle", "scooter", "car.fill"]
    
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().backgroundColor = UIColor.white.withAlphaComponent(0.25)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor .white], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor( red: 111/255, green: 133/255, blue: 41/255, alpha: 1)], for: .selected)
    }

    
    var body: some View {
        
        VStack {
            
                    
// ------------ Section en-tête -------------------
                    VStack {
                        Image("avatorSquare")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(height: 100)
                        
                        Text("\(userName)")
                            .font(.title2)
                        
//                        Text("\(userPoints) points")
//                            .padding(.bottom, 25)
                    }
                    
// ------------Section liste de l'historique -------------------
                    ZStack {
                        Rectangle()
                            .foregroundColor (Color ("mobilixGreen"))
                        
                        
                        VStack {
                            
                            Text("Historique de tes déplacements")
                                .foregroundColor(.white)
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(EdgeInsets(
                                    top: 35,
                                    leading: 10,
                                    bottom: 28,
                                    trailing: 10))
                            
                            
                            Picker("Filter", selection: $filterValueIndex) {
                                ForEach(filterChoices.indices, id: \.self) {
                                    if filterValues == [Mobility.all] {
                                        Image(systemName: "\(filterChoices[$0])")
                                    } else {
                                        Image(systemName: "\(filterChoices[$0])")
                                    }
                                    
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .scaleEffect(x: 1, y: 1.2)
                            .padding(.horizontal, 25)
                            
                            
                            
                            List(filterdHistory) {
                                history in HistoryRowWiew(historyrow: history)
                            }
                            .scrollContentBackground(.hidden)

                            // On filtre les composants de l'Array en fonction de type
                            .onChange(of: filterValueIndex) {
                                value in
                                if filterValueIndex == 0 {
                                    filterdHistory = historylist
                                } else {
                                    filterdHistory = listHistory.filter { $0.type.rawValue == filterValues[filterValueIndex].rawValue}
                                }
                            }
                            
                            
                        }
                    }
                
        } // end VStack
        .navigationBarTitle("Historique de tes déplacements")
                
    }
}
        

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

struct HistoryRowWiew: View {
    
    var historyrow : History
    
    var body: some View {
        HStack {
            Text("\(historyrow.date)  ")
                .font(.caption)
                .padding(.vertical, 10)
            Image(historyrow.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 18)
            Spacer()
            //            Image(systemName: "star.fill")
            //                .foregroundColor(Color("mobilixOrange"))
            //                .font(.caption)
            HStack {
                Text( "\(historyrow.points)")
                Text( "points")
                    .font(.caption)
            }
        }
        .padding(.horizontal, 16)
    }
}
