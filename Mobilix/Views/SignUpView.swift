//
//  SignUpView.swift
//  Mobilix
//
//  Created by Yuko SENGOKU on 15/05/2023.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var email = ""
    @State private var codeParrainage = "  \(louise.codeSponsoring)"
    
    var body: some View {
                    
            VStack{
                Image("logoMobilix")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 180)
                
                Text("Avec Mobilix, tu es récompensé de tes choix de mobilité plus réspecteux ! ")
                    .font(.callout)
                    .foregroundColor(Color("mobilixGreen"))
                    .frame(width: 320)
                    .padding(.bottom)
                
                VStack (alignment: .leading){
                    
                    TextField("Nom d'utilisateur", text: $username)
                        .padding()
                        .frame(width: 320, height: 50)
                        .background(Color.black.opacity(0.09))
                        .border(Color("mobilixGreen"))
                        .cornerRadius(10)
                        .padding(.bottom, 5)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 320, height: 50)
                        .background(Color.black.opacity(0.09))
                        .border(Color("mobilixGreen"))
                        .cornerRadius(10)
                        .padding(.bottom, 5)
                    
                    
                    SecureField("Mot de passe", text: $password)
                        .padding()
                        .frame(width: 320, height: 50)
                        .background(Color.black.opacity(0.09))
                        .cornerRadius(10)
                        .border(Color("mobilixGreen"))
                        .cornerRadius(10)
                        .padding(.bottom, 5)
                    
                    Text("Code de parrainage")
                        .padding(.top)
                        .foregroundColor(Color("mobilixOrange"))
                    
                    TextField("Code de parrainage", text: $codeParrainage)
                        .frame(width: 320, height: 50)
                        .background(Color.black.opacity(0.09))
                        .border(Color("mobilixGreen"))
                        .cornerRadius(10)
                        .padding(.bottom)
                    
                    ZStack {
                        Rectangle ()
                            .foregroundColor(Color("mobilixGreen"))
                            .frame(width: 330, height: 50)
                            .cornerRadius(10)

                        
                        Text("Je m'inscris à Mobilix")
                        
                        
                            .foregroundColor(.white)
                    }
                }
                .padding(.vertical)
                
            }
            .navigationBarHidden(true)
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
