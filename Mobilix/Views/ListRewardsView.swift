//
//  ListRewardsView.swift
//  Mobilix
//
//  Created by Werner Mona on 03/05/2023.
//

import SwiftUI

struct ListRewardsView: View {
    
    @State var userName: String = louise.name
    @State var currentPoints: Int = louise.points
    
    var gridLayout = [
            GridItem(.flexible()),
            GridItem(.flexible())]
    
    var listRewards: [Reward] = rewardsList
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
 
        // -------------　Section en-tête
//                ZStack {
//                   Rectangle()
//                        .fill(Color("mobilixGreen"))
                    
                    
                                                
                Text("\(userName)")
                    .font(.title2)
                    .padding(.top, 15)
                
                HStack {
                        Text(verbatim: "\(currentPoints)")
                            .font(.title)
                            .fontWeight(.bold)
                         
                        Text("points")
//                            .foregroundColor(.white)
                            .font(.title3)                        
                    }
                   .foregroundColor(Color("mobilixGreen"))
//                    .padding(.top)
                    
//                }
//                .frame(height: 70)
                
                // ----------- Section Offres -----------
                ScrollView(.vertical) {
                    
//                    VStack {
                        
                        // ------- Offre mise en avant -----
                            VStack {
                                
                                Text("Offre du moment")
                                    .padding(.top)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                NavigationLink {
                                    RewardView(rewardDetail: legumesEmma)
                                } label: {
                                
                                    LimitedOffer()
                                    
                            }
                            .cornerRadius(10)
                            .padding(.horizontal)

                            
                        }
                        .padding(.vertical, 5)
                        
                        
                        
                        // ----------- Liste offres -----------
                        VStack {
                            
                            Text("Nos offres")
                                .padding(.top, 20)
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            // --- Grid List ---
                            LazyVGrid(columns: gridLayout, spacing: 15) {
                                ForEach(listRewards) { reward in
                                    
                                    NavigationLink {
                                        RewardView(rewardDetail: reward)
                                    } label: {
                                        Offer(offer: reward)
                                    }
                                }
                            }
                        }
//                    }
                    .padding(.horizontal)
                    
                } //end scroll
                .onAppear {
//                    let tabBarAppearance = UITabBarAppearance()
//                    tabBarAppearance.configureWithDefaultBackground()
                    UITabBar.appearance().backgroundColor = .gray
                    UITabBar.appearance().barTintColor = .gray
                }
                
            } // end VStack
            .navigationBarTitle("Récompenses")
            .navigationBarTitleDisplayMode(.inline)
            
            
        } // end Navigation View
        
    } // end body    }
}

struct ListRewardsView_Previews: PreviewProvider {
    static var previews: some View {
        ListRewardsView()
    }
}

struct Offer: View {
        
    var offer: Reward
        
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(width: 170, height: 180)

            
            VStack {
                Image(offer.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 170)
                
                VStack {
                    Text(offer.title)
                    Text(offer.company)
                        .foregroundColor(Color("mobilixGreen"))
                        .fontWeight(.bold)
                        .padding(.bottom, 3)
                }
//                .foregroundColor(Color("darkGreen"))
                .foregroundColor(.black)
                .padding(.bottom, 5)
                .font(.subheadline)
            }
            

            ZStack {
                Rectangle()
                    .fill(.white)
                
                Text(verbatim: "\(offer.neededPoints) points")
                    .foregroundColor(Color("darkGreen"))
                    .font(.caption2)
                    .fontWeight(.semibold)

                }
                .cornerRadius(5)
                .frame(width: 75, height: 20)
                .position(x: 45, y: 20) // placer en haut à gauche
            
        }
        .cornerRadius(10)
        .frame(width: 170, height: 180)
        .padding(.top, 5)
        .shadow(color: .gray.opacity(0.4), radius: 5, x: 1, y: 3)
        
    }
    
    
}

struct LimitedOffer: View {
    
    var limitedOffer: Reward = legumesEmma
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill((Color("mobilixGreen")))
                .frame(height: 300)
                .cornerRadius(10)
            
            VStack {
                Image("veggyBasket")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 240)
                
                
                Text("\(limitedOffer.title)  |  \(limitedOffer.company)")
                    .foregroundColor(.white)
                    .font(.title2)
                    .frame(width: 300, height:50)
                    .padding(.bottom, 20)
            }
            
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.white)
                    
                    Text("\(limitedOffer.neededPoints) points")
                        .fontWeight(.semibold)
                        .foregroundColor((Color("darkGreen")))
                    
                }
                .cornerRadius(5)
                .frame(width: 105, height: 30, alignment: .topLeading)
                .position(x: 70, y: 32)
                
            }
        }
        .shadow(color: .gray.opacity(0.1), radius: 1, x: 0.1, y: 0.1)

    }
}
