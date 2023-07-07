//
//  ReservationView.swift
//  Mobilix
//
//  Created by Werner Mona on 11/05/2023.
//

import SwiftUI


struct ReservationView: View {
    
    var placeDetail: Place
    
    @State var isConfirmed: Bool = false
    
    @State var isAnimated = false
    
    @State var returnToMap: Bool = false
    
    var userProfile: User = louise
    
    
    @State var hearts = 10
        
        func heartAction () {
            hearts += 5
        }
    
    
    
    
    var body: some View {
                
        VStack {
            Image(placeDetail.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 60)
                    .padding(24)
            
            VStack (alignment: .leading){
                if placeDetail.type == "ce vélo" {
                    Text("Ce vélo est situé à")
                } else if placeDetail.type == "cette trottinette"{
                    Text("Cette trotinette est située à")
                } else {
                    Text("Cette voiture est située à")
                }

                Text("\(placeDetail.adress)")
                    .font(.title3)
            }
 
                .padding(EdgeInsets(
                    top: 20,
                    leading: 35,
                    bottom: 10,
                    trailing: 35))
 
           
            Text("Ta réservation sera varable pendant 20 minutes à partir du moment où tu la confirmes. Pense bien à commencer ton trajet durant ce délai.")
                .padding(32)
                
            Text("Souhaites-tu confirmer la réservation ?")
            .font(.callout)
            .multilineTextAlignment(.center)
            .padding(EdgeInsets(
                top: 30,
                leading: 35,
                bottom: 3,
                trailing: 35))
            
            
            Button {
                isConfirmed = true
            } label: {
                Text("Confirmer la réservation")
            }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background((Color ("mobilixGreen")))
            .cornerRadius(10)
            .padding(.bottom, 30)
            
            .sheet(isPresented: $isConfirmed) {

// ----------- Modal -----------
                VStack (spacing: 0) {
                    
                    HStack {
                        Spacer()
                        Button {
                            returnToMap = true
                        } label: {
                            Text("Fermer")
                                .foregroundColor(Color("mobilixGreen"))
                                .padding(.trailing, 25)
                        }
                        .fullScreenCover(isPresented: $returnToMap) {
                            ContentView()
                        }
                    }
                    .padding(.top, 30)
                    
                    
                    
                    Spacer()
                        .frame(height: 160)
                    
                    HStack {
                        Text("Merci, \(userProfile.name)")
                            .font(.title)
                        
        // ----------- Hearts animation --------------
                        ZStack {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .padding()
                                .onAppear() {
                                    heartAction()
                                }
                            
                            ForEach (0..<hearts, id: \.self){ _ in
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .modifier(HeartMovementModifier())
                                    .padding()
                            }
                            
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("mobilixGreen"))
                                .font(.largeTitle)

                            
                        }.foregroundColor(.white.opacity(0.5))

        // ----------- end Hearts animation --------------
                        
                    }

                    .padding(35)
                    
                    VStack (alignment: .leading) {
                        Text("Ta réservation a bien été enregistrée !")
                            .font(.title3)
                            .padding(.bottom, 1)
                        
                        HStack {
                            
                            Text("Elle est valable pendant 20 minutes")
                            Image(systemName:"face.smiling")
 //                               .foregroundColor(.yellow)
                         }
                        .font(.title3)
                        .padding(.bottom, 65)
                        
                    }
                    
                    HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                        Text("Pense bien à commencer ton trajet durant ce délai.")
                            .font(.title3)
                            
                    }
                    .frame(width: 350)
                    
                    Spacer()
                    
                }
                .background(Color("mobilixGreen").opacity(0.08))
                .edgesIgnoringSafeArea(.all)
 //               .frame(width: 350)
// ------------- end Modal -------------
                
                
            }
                        
        } // end VStack
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView(placeDetail: place10)
    }
}
