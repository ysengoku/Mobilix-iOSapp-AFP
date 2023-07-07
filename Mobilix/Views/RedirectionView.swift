//
//  RedirectionView.swift
//  }
//
//  Created by Werner Mona on 11/05/2023.
//

import SwiftUI

struct RedirectionView: View {
    
    @State private var count = 5
    @State private var isCountDown = true
    
    @State var isShow = false
    @State var returnToHome = false
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Image("logoMobilix")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180)
                    .padding(20)
                
                    
                VStack {
                    Text("Tu vas être redirigé")
                        .font(.title2)
//                        .padding(1)
                    
                    HStack {
                        Text("sur l'App")
                            .font(.title2)
                        Text("Mobilix")
                            .font(.title)
//                            .foregroundColor(Color("mobilixOrange"))
                    }
                        
                    Text("dans \(self.count) secondes")
                        .font(.title2)
                        .padding(10)
                  
                        
                }
                .foregroundColor(.black)
                .padding(50)
                    
                .onAppear() {
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in self.count -= 1
                        if self.count == 0 {
                            timer.invalidate()
                            self.isCountDown = false
                        }
                    }
                }
                            
                        Button {
                            returnToHome = true
                        } label: {
                                Text("""
Appuyer ici si la page ne change pas
dans 5 secondes
""")
                                .underline()
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal, 50)
                        }
                        .fullScreenCover(isPresented: $returnToHome) {
                            ContentView()
                        }
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                    returnToHome = true
                            }
                        }
                
            } // end of the biggest VStack
            .navigationBarHidden(true)
        }
    }
}
        

struct RedirectionView_Previews: PreviewProvider {
    static var previews: some View {
        RedirectionView()
    }
}


/*
                            NavigationLink {
                                ProfileView()
                            } label: {
                                
                                
                                ZStack{
                                    Rectangle()
                                        .frame(width: 280, height: 60)
                                        .foregroundColor(Color("mobilixGreen")
                                            .opacity(0.2))
                                        .cornerRadius(10)
                                        .padding(.horizontal, 10)
                                    
                                    Text("C'est parti !")
                                        .font(.title3)
                                        .foregroundColor(Color("darkGreen"))
                                        .bold()
                                    
                                }
                                
                            }
//                            .padding(.top, 30)
                            */
