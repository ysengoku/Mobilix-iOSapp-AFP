//
//  InviteFriendView.swift
//  Mobilix
//
//  Created by Werner Mona on 03/05/2023.
//

import SwiftUI

struct InviteFriendView: View {
    var body: some View {
        
        ScrollView {
            
            
            VStack {
                
                Image("friends")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 165)
                    .padding(.top, 15)
                
                VStack {
                    
                    Text("""
Si tu aides tes amis à choisir
la mobilité verte ?
""")
                    .multilineTextAlignment(.center)
                    .font(.callout)
                    .foregroundColor(.black.opacity(0.8))
                    .padding(EdgeInsets(
                        top: 32,
                        leading: 25,
                        bottom: 5,
                        trailing: 25))
                    
                    VStack (alignment: .center){
                        
                        Text("30 points")
                            .font(.largeTitle)
                            .foregroundColor(Color("mobilixGreen"))
                        
                        Text("pour toi")
                            .font(.title2)
                        
                        Text("+")
                            .font(.title2)
                        
                        Text("30 points")
                            .font(.largeTitle)
                            .foregroundColor(Color("mobilixGreen"))
                        
                        Text("pour tes amis")
                            .font(.title2)
                    }
                    .fontWeight(.bold)
                }
                .padding(EdgeInsets(
                    top: 10,
                    leading: 32,
                    bottom: 32,
                    trailing: 32))
            }
            
// ------------ Section code de parrainage --------------
            VStack {
                Text("Ton code de parrainage")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("darkGreen"))
                    .padding(EdgeInsets(
                        top: 15,
                        leading: 0,
                        bottom: 5,
                        trailing: 0
                    ))
                
                
                Button {
                    //
                } label: {
                    Text(louise.codeSponsoring)
                        .padding(.leading, 50)
                    Image(systemName: "doc.on.doc")
                        .padding(.leading, 40)
                }
                .frame(maxWidth: 250)
                .padding(15)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1))
                
                
                ShareLink(
                    item: "\(louise.codeSponsoring)",
                    subject: Text("Mon code de parrainage Mobilix"),
                    message: Text("Mon code de parrainage Mobilix")) {
                        ZStack {
                            Rectangle()
                                .fill(Color("mobilixGreen"))
                                .frame(width: 200, height: 50)
                                .cornerRadius(10)
                            Text("Inviter tes amis")
                                .foregroundColor(.white)
                                .font(.title3)
                        }
                    }
                    .padding(.vertical, 5)
            }
 
                
// ------------ Section comment ça marche -------------
            VStack {
                Text("Comment ça marche ?")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(
                        top: 55,
                        leading: 0,
                        bottom: 20,
                        trailing: 0
                    ))
                    
                Image(systemName: "1.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color("mobilixGreen"))
                    .padding(.bottom, 3)
                Text("Inviter tes amis")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color("darkGreen"))

                Text("Partager ton code de parrainage à tes amis et parler de Mobilix.")
                    .padding(.bottom, 15)
                    
                Image(systemName: "2.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color("mobilixGreen"))
                    .padding(.bottom, 3)
                Text("Tes amis réjoignent Mobilix")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color("darkGreen"))
                Text("Tes amis téléchargent l'app Mobilix et créent leurs comptes en utilisant ton code de parrainage")
                    .padding(.bottom, 15)
                    
                Image(systemName: "3.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color("mobilixGreen"))
                    .padding(.bottom, 3)
                Text("Recevoir les points bonus")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color("darkGreen"))
                Text("30 points seront offerts sur ton compte et ceux de tes amis sous 15 jours.")
                    .padding(.bottom, 10)
                    
                }
            .frame(width: 300)
                
            } // end scrollView
            .navigationBarTitle("Parrainer tes amis")
            
    }
    }


struct InviteFriendView_Previews: PreviewProvider {
    static var previews: some View {
        InviteFriendView()
    }
}


