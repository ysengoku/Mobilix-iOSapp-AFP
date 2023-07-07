//
//  AccountConnectionView.swift
//  Mobilix
//
//  Created by Yuko SENGOKU on 10/05/2023.
//

import SwiftUI

struct AccountConnectionView: View {
    
    @State var account: Account
    
    @State private var username = ""
    @State private var password = ""
    
    @State var goToHome: Bool = false

    
    var body: some View {
            
            VStack {
                
                Image(account.logo)
                
                VStack {
                    
                    TextField("Nom d'utilisateur", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.09))
                        .cornerRadius(10)
                        .border(.white)
                        .padding(.bottom, 10)
                    
                    
                    SecureField("Mot de passe", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.09))
                        .cornerRadius(10)
                        .padding(.bottom, 30)
                    

                    NavigationLink {
                        RedirectionView()
                    } label: {
                        Text("Se connecter")
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(account.markColor)
                    .cornerRadius(10)
                    

                    
                    
                    Button {
                        goToHome = true
                    } label: {
                        Text("Annuler et revenir à l'App Mobilix")
                    }
                    .foregroundColor(.pink)
                    .padding(.top, 30)
                    .fullScreenCover(isPresented: $goToHome) {
                        ContentView()
                    }
                    
                }
                .padding(.vertical, 25)
                
            }

            .navigationBarHidden(true)
        

  
    } //end body
}

struct AccountConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        AccountConnectionView(account: tierAccount)
    }
}
