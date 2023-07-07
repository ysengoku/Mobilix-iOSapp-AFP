//
//  SettingView.swift
//  Mobilix
//
//  Created by Werner Mona on 03/05/2023.
//

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
    
    class Coordinator: NSObject, UINavigationControllerDelegate, PHPickerViewControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.presentationMode.wrappedValue.dismiss()

            if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, _ in
                    guard let image = image as? UIImage else {
                        return
                    }
                    DispatchQueue.main.sync {
                        self?.parent.image = image
                    }
                }
            }
        }
    }
}



struct SettingView: View {
    
    @State var image: UIImage?
    @State var showingAlert: Bool = false

    
    
    @State var userName: String = louise.name
    @State private var username = louise.name
    @State private var password = louise.password
    @State private var email = louise.email

    
    @State var accountsStatus = louiseAccounts
       
//    var account: Account
    @State var showAlert = false
    

// -------------------------- body ----------------------
    
    var body: some View {
        

        
            ScrollView {
                
                
                VStack {

                    
    // ------------- Section nom & avatar -------------
                    Text(" \(userName) ")
                        .foregroundColor(Color("mobilixGreen"))
                        .font(.title2)
                    
                    VStack {
                        if let image = image {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(height: 120)
                        } else {
                            Image("avatorSquare")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(height: 120)
                        }
                        
                        Button {
                            showingAlert = true
                        } label: {
                            Text("Changer l'avatar")
                        }
                        .foregroundColor(.black.opacity(0.8))
                        .font(.callout)
                        .padding(.bottom, 40)
                        
                    }
                    .sheet(isPresented: $showingAlert) {
                        
                    } content: {
                        ImagePicker(image: $image)
                    }
                    

                    
    //------------- Section Modifier les infos -------------
                    Text("Modifier les informations")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.bottom)
                    
                    ZStack {
                        
                        Rectangle()
                            .fill(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                        
                        VStack {
                            
                            VStack {
                                
                                VStack (alignment: .leading){
                                    Text(" Nom")
                                    Spacer()
                                    TextField("Nom d'utilisateur", text: $username)
                                        .padding()
                                        .frame(width: 310, height: 50)
                                        .background(Color.black.opacity(0.09))
                                        .cornerRadius(10)
                                        .border(.white)
                                    //                    .border(.red, width: CGFloat(wrongUsername))
                                        .padding(.bottom, 10)
                                }
                                
                                VStack (alignment: .leading) {
                                    Text(" Email")
                                    Spacer()
                                    TextField("Email", text: $email)
                                        .padding()
                                        .frame(width: 310, height: 50)
                                        .background(Color.black.opacity(0.09))
                                        .cornerRadius(10)
                                    //                    .border(.red, width: CGFloat(wrongPassword))
                                        .padding(.bottom, 10)
                                }
                                
                                VStack (alignment: .leading) {
                                    Text(" Mot de pass")
                                    Spacer()
                                    SecureField("Mot de passe", text: $password)
                                        .padding()
                                        .frame(width: 310, height: 50)
                                        .background(Color.black.opacity(0.09))
                                        .cornerRadius(10)
                                    //                    .border(.red, width: CGFloat(wrongPassword))
                                        .padding(.bottom)
                                }
                            }
                            .frame(width: 350)
                            
                            Button {
                                //
                            } label: {
                                Text("Enregistrer la modification")
                            }
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background((Color ("mobilixGreen")))
                            .cornerRadius(10)
                            
                        }
                        .padding(.vertical, 25)
                    }
                    .padding(.bottom, 40)
                    

                    
    // ----------Section comptes associés -------------
                    Section {
                        List {
                            ForEach(accountsStatus) {account in
                                
   // ---------------- List Row ----------------
                                HStack {
                                    Image(account.logo)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 120, height: 20)
                                    
                                    Spacer()
                                        .frame(width: 8)
                                    
                                    Image(systemName: account.mobilityIcon)
//                                        .font(.callout)
                                    
                                    Spacer()
                                        .frame(width: 55)
                                    
                                    if account.connected == true {
                                        
                                    Button {
                                        showAlert = true
//                                        account.connected = false
                                    } label: {
                                        Text("Déconnexion")
                                            .font(.callout)
                                            .foregroundColor(.pink)
                                    }
                                    .alert(isPresented: $showAlert){
                                        Alert(title: Text("Veux-tu vraiment te déconnecter ?"),
                                              message: Text(""),
                                              dismissButton: .default(Text("OK")))
                                    } // end alert
                                        
                                    } else {
                                        ZStack {
                                            Text("Se connecter")
                                                .font(.callout)
                                                .foregroundColor(.blue)
                                                
                                            NavigationLink {
                                                        AccountConnectionView(account: account)
                                                                 
                                                    } label: {
                                                      EmptyView()
                                                    }
                                                    .opacity(0)
                                               // }
                                        }
                                    }
                                }
                                .frame(width: 310, height: 37)
                                .padding(.trailing)
        // ----------- end List Row  ----------------
                                
                                
                          }
                            
                        }
                        .frame(height: 340) // si la liste n'affiche pas, il faut modifier la height.
                        .scrollDisabled(true)
                        
                    }
                header: {Text("Gérer les comptes partenaires")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(height: 1) // header of the accounts list
                        .padding(EdgeInsets(
                            top: 35,
                            leading: 20,
                            bottom: 0,
                            trailing: 20))
                }
                                        
                                        
                } // end VStack
            }// end scroll view
            .background(Color(UIColor( red: 242/255, green: 242/255, blue: 247/255, alpha: 1)))

        
    } // end body
}



struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}



/*
 HStack {
     Image(account.logo)
         .resizable()
         .scaledToFit()
         .frame(width: 100, height: 20)
     
     Image(systemName: account.mobilityIcon)
         .font(.callout)
     
     Spacer()
         .frame(width: 35)
     
     if account.connected == true {
         
     Button {
         showAlert = true
     } label: {
         Text("Déonnexion")
             .font(.callout)
             .foregroundColor(.pink)
     }
     .alert(isPresented: $showAlert){
         Alert(title: Text("Veux-tu vraiment te déconnecter ?"),
               message: Text(""),
               dismissButton: .default(Text("OK")))
     } // end alert
         
     } else {

             ZStack {
                 Text("Se connecter")
                     .font(.callout)
                 
                 ForEach(accountsStatus) {userAccount in
                     NavigationLink {
                         AccountConnectionView(account: account)
                     } label: {
                         EmptyView()
                     }
                     .opacity(0)
                 }
         }
     }
 }
 .frame(width: 280, height: 40)
 .padding(.horizontal)
 */
