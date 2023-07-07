//
//  ProfileView.swift
//  Mobilix
//
//  Created by Werner Mona on 03/05/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var userName: String = louise.name
    @State var currentPoints: Int = louise.points
    
    @State private var latestRides: [History] = [history1, history2, history3]
    
    
// pour appeler le variable User
    @State var listApps = louise.mobilityApps
    // ----->["velov2", "tier1", "citiz", "dott", "zity"]

// pour afficher Confirmation dialog
    @State var goToMobilityapps = false
    
    @State var accountsList = louiseAccounts
    
    
    var body: some View {

        NavigationView {
            
            
            VStack {
                
                // ------------ Navigation vers SettingView ------------
                HStack{
                    
                    Spacer()
                    
                    NavigationLink {
                        SettingView()
                    } label: {

                            Image(systemName: "gearshape.fill")
                                .font(.title2)
                                .padding(.horizontal)
                                .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                
                ScrollView {
    // ------------ Section en-tête ----------------------------------
                
                    VStack{
                    
                        Text("Hello, \(userName) !")
                            .font(.title2)
                    
                        Image("avatorSquare")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(height: 100)
                    }
                    .padding(.vertical, 10)
                    .frame(height: 140)
                
                   
          // ----------- Afffichage des points gagnés -----------
                    //                    ZStack{
                    //                        Rectangle()
                    //                            .frame(height: 140)
                    //                            .foregroundColor(Color ("mobilixGreen"))
                    
                    HStack {
//                            Text("Tu as gagné")
//                                .font(.title2)
//                                .padding(1)
                        
                        Text(verbatim: "\(currentPoints)")
                            .font(.largeTitle)
                            .bold()
                        
                        Text("points")
                            .font(.title2)
                        
                    }
                    .foregroundColor(Color("mobilixGreen"))
                    .padding(.bottom, 40)
                

//            }
                    
// ------------- Main section -----------------------------------
                    
                    
        // ----------- Section History -----------
                    Section {
                        //                        Text("Tes derniers trajets")
                        //                            .font(.title3)
                        //                            .fontWeight(.bold)
                        
                // -------- Liste 3 derniers trajets
                        List(latestRides) { ride in
                            LatestRidesRowView(rideRow: ride)
                        }
                        .frame(height: 150)
                        .scrollContentBackground(.hidden)
                        .scrollDisabled(true)
                        .listStyle(.plain)

                    } header: {
                        Text("Tes derniers trajets")
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(height: 40)
                    }
                
                        
                // ------- Lien vers HistoryView
                        NavigationLink {
                            HistoryView()
                        } label: {
                            
                            ZStack{
                                Rectangle()
                                    .frame(width: 330, height: 60)
                                    .foregroundColor(Color("mobilixGreen"))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 10)
                                
                                Text("Voir l'historique complet")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            .padding(.top, 1)

                        }
                    
                    
                    
                    
            // ---------- Section lien vers Parrainage -----------
                    
                    NavigationLink {
                        InviteFriendView()
                    } label: {
                        VStack {
                            
                            Text("Pour gagner  des points bonus")
                                .foregroundColor(Color("darkGreen"))
                                .font(.title3)
 //                               .fontWeight(.bold)
                            
                            ZStack{
                                Rectangle()
                                    .frame(width: 330, height: 55)
                                    .foregroundColor(Color("mobilixGreen")
                                        .opacity(0.2))
                                    .cornerRadius(10)
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color("mobilixGreen"), lineWidth: 1))
                                    .padding(.horizontal, 10)
                                
                                Text("Parrainer tes amis")
                                    .font(.title3)
                                    .foregroundColor(Color("darkGreen"))
                                    .bold()
                                
                            }
                        }
                    }
                    .padding(.top, 32)
                    
                    
// ----------- Section List des comptes associés -----------
                    Section {
                        
                        Text("Comptes associés")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(EdgeInsets (top: 45, leading: 20, bottom: 15, trailing: 20))

                    
                     
                        List {
                            ForEach(accountsList) { account in
                                
        // -------------- List Row -----------
                                HStack {
                                    Image(account.logo)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 115, height: 20)
                                    
                                    Spacer()
                                        .frame(width: 10)
                                    
                                    Image(systemName:account.mobilityIcon)
                                    
                                    Spacer()
                                        .frame(width: 55)
                                    
                                    if account.connected == true {
                                        Text("Connecté        ")
                                            .foregroundColor(Color("mobilixGreen"))
                                    } else {
                                        ZStack {
                                            
                                            Text("Non connecté")
                                                .foregroundColor(.pink)
                                            
                                            NavigationLink {
                                                AccountConnectionView(account: account)
                                            } label: {
                                                EmptyView()
                                            }
                                            .opacity(0)
                                            
                                        }
                                    }
                                }
                                .frame(width: 320, height: 35)
                                .padding(.trailing, 25)
                            }

        // --------------- end List Row  ----------------
                            
                        }// end List
                        .frame(width: 350, height: 240, alignment: .leading)
                        .scrollContentBackground(.hidden)
                        .scrollDisabled(true)
                        .listStyle(.plain)
                        
                        
                        NavigationLink(
                            destination: SettingView(),
                            label: {
                                Text("Gérer les comptes partenaires    >")
                                    .foregroundColor(Color("mobilixOrange"))
                            })
                    } // end section comptes associés
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Se déconnacter")
                    }
                    .foregroundColor(.pink)
                    .padding(.top, 25)


                    
                } // end scroll view
                
                }
            .navigationBarTitle("Profil")
            .navigationBarTitleDisplayMode(.inline)
            
            } // end nav view
        }
    }


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


struct IconMobilityView: View {
    var iconMobility: String
    var body: some View {
        Image(iconMobility)
            .resizable()
            .frame (width: 75, height: 75)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.4), radius: 5, x: 3, y: 3)
            .padding(7)
    }
}



struct LatestRidesRowView: View {
    
    var rideRow: History
    
    var body: some View {
        HStack {
            Text("\(rideRow.date) ")
            Spacer()
                .frame(width: 25)
            Image(rideRow.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 25)
            Spacer()
            Text("\(rideRow.points) points")
        }
        .padding(.horizontal, 10)
    }
}



// ------------ Liste apps

/*                   ScrollView (.horizontal) {
    
    LazyHStack {
        
        ForEach(listApps, id: \.self) {
            icon in
            
            Button {
                goToMobilityapps = true
            } label: {
                IconMobilityView(iconMobility: icon)
            }
            .frame (width: 70, height: 70)
            .padding(10)

            
            .alert(isPresented: $goToMobilityapps) {
                Alert(title: Text("Ouvrir l'app ?"),
                      message: Text(""),
                      dismissButton: .default(Text("OK")))
            } // end alert

        }
        
    } // end LazyHStack
    .padding(.horizontal)
         
    

        Image("zity")
            .resizable()
            .frame (width: 70, height: 70)
            .padding(1)
        
         
         Image("velov2")
         .resizable()
         .frame (width: 70, height: 70)
         .padding(10)
         
         Image("dott")
         .resizable()
         .frame (width: 70, height: 70)
         .padding(10)
         
         Image("leo")
         .resizable()
         .frame (width: 70, height: 70)
         .padding(10)
         
         Image("citiz")
         .resizable()
         .frame (width: 70, height: 70)
         .padding(10)
         
         
        
    } // end ScrollView horizontale */
