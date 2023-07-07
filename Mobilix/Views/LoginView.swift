//
//  SettingView.swift
//  Mobilix
//
//  Created by Werner Mona on 03/05/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var email = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    
    var body: some View {
        
//        NavigationView{
            
            ZStack {
                Color.white
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(Color("mobilixGreen"))
                Circle()
                    .scale(1.2)
                    .foregroundColor(.white.opacity(0.9))
                
                VStack{
                    Image("logoMobilix")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 180)
                        .padding()
                    
                    
                    TextField("Nom d'utilisateur", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.09))
                        .border(Color("mobilixGreen"))
                        .border(.red, width: CGFloat(wrongUsername))
                        .cornerRadius(10)
                    
                    
                    SecureField("Mot de passe", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.09))
                        .cornerRadius(10)
                        .border(Color("mobilixGreen"))
                        .border(.red, width: CGFloat(wrongPassword))
                        .cornerRadius(10)
                    
                    
                    Button("Se connecter") {
                        authenticateUser(username: username, password: password)

                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color("mobilixOrange"))
                    .cornerRadius(10)
                    
                    
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("Tu n'as pas encore de compte ? Inscris-toi ici")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .frame(width: 250)
                            .padding(.vertical)
                    }

                    
        
                }
                .fullScreenCover(isPresented: $showingLoginScreen) {
                    ContentView()
                }
            }
            .navigationBarHidden(true)
//        }
        
    }
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == louise.name.lowercased() {
            wrongUsername = 0
            if password.lowercased() == louise.password {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
