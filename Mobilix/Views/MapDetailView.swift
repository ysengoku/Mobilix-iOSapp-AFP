//
//  MapDetailView.swift
//  Mobilix
//
//  Created by Werner Mona on 03/05/2023.
//

import SwiftUI

struct MapDetailView: View {
    
    var placeDetail: Place
    
    @Environment(\.dismiss) var dismiss
    
    @State private var moveToReservationView = false
    

    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Image(placeDetail.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 64)
                    .padding(.vertical, 10)
                
                VStack (alignment: .leading){
                    
                    if placeDetail.type == "ce vélo" {
                        Text("Ce vélo est situé à")
                            .font(.callout)
                    } else if placeDetail.type == "cette trottinette"{
                        Text("Cette trotinette est située à")
                            .font(.callout)
                    } else {
                        Text("Cette voiture est située à")
                            .font(.callout)
                    }
                    
                    Text("\(placeDetail.adress)")
                        .padding(.bottom, 10)
                        .font(.callout)
                
                Text("\(placeDetail.description)")
                    .font(.caption)

                    
                }
                .padding(.horizontal, 30)
                
                
                
                HStack {
                    Text("Avec \(placeDetail.title), obtiens")
                        .font(.callout)
                    
                    HStack {
                        Text("\(placeDetail.points)")
                            .font(.title3)
                             .fontWeight(.bold)
                        Text("points")
                            .font(.title3)
                    }
                }
                .padding(.top)

                
                
                Button {
                    moveToReservationView.toggle()
                    
                } label: {
                    
                    Text("Réserver \(placeDetail.type) maintenant")
                        .foregroundColor(.white)
                        .font(.title3)
//                        .fontWeight(.bold)
                        .padding(10)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("mobilixGreen"))
                .controlSize(.regular)
                .frame(width: 366)
                .padding(10)
                .fullScreenCover(isPresented: $moveToReservationView) {
                    ReservationView(placeDetail: placeDetail)
                    
                }
                                
            } // end VStack
            .padding(.horizontal)
            .frame(height: 500)
        }
        
    }
}


struct MapDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MapDetailView(placeDetail: place6)
    }
}


                            
/*
Button {
    moveToReservationView.toggle()
    
/* --------------------------------------------------
Il faut une action pour fermer la modale ou changer la taille de la modale
-------------------------------------------------- */

    
} label: {
    
    Text("Réserver \(placeDetail.title) maintenant")
        .foregroundColor(.white)
        .font(.title3)
        .fontWeight(.bold)
        .padding(5)
}
.buttonStyle(.borderedProminent)
.tint(Color("mobilixGreen"))
.controlSize(.regular)
.padding(10)

 .navigationDestination(isPresented: $moveToReservationView, destination: {
    ReservationView(placeDetail: placeDetail)
})

*/



/*
 // -------- NavigationLink ----------
 NavigationLink {
 ReservationView(placeDetail: placeDetail)
 } label: {
 
 ZStack {
 Rectangle()
 .fill(Color("mobilixGreen"))
 .frame(width: 300, height: 50)
 .cornerRadius(10)
 
 Text("Réserver \(placeDetail.title) maintenant")
 .foregroundColor(.white)
 .font(.title3)
 .fontWeight(.bold)
 .padding(5)
 
 }
 .padding(10)

 }
 // -------- NavigationLink ----------
 
 */
