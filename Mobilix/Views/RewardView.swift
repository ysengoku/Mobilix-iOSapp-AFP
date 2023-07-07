//
//  Rewardview.swift
//  Mobilix
//
//  Created by Werner Mona on 03/05/2023.
//

import SwiftUI

struct HeartsGeometryEffect : GeometryEffect {
    var time : Double
    var speed = Double.random(in: 100 ... 400)
    var xDirection = Double.random(in:  -0.05 ... 0.05)
    var yDirection = Double.random(in: -Double.pi ...  0)
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * xDirection
        let yTranslation = speed * sin(yDirection) * time
        let affineTranslation =  CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
}


struct HeartMovementModifier: ViewModifier {
    @State var time = 0.0
    let duration = 3.0
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .foregroundColor(Color("mobilixGreen"))
                .modifier(HeartsGeometryEffect(time: time))
                .opacity(time == 3 ? 0 : 1)
        }
        .onAppear {
            withAnimation (.easeOut(duration: duration)) {
                self.time = duration
            }
        }
    }
}






struct RewardView: View {
 
    var rewardDetail: Reward
    var userProfil: User = louise
    
    @State private var showConfirmation = false
    @State private var isConfirmed = false
    
//    var pointsNeeded = rewardDetail.neededPoints
    @State var currentPoints = louise.points
    
    @State private var deactivateButton: Bool = true

    @State private var isAnimated = false


    
    @State var hearts = 10
        
        func heartAction () {
            hearts += 5
        }
    
    
    

    
    var body: some View {
        
        ScrollView {
            
            VStack {
                Image(rewardDetail.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400, height: 280)
                
                
                VStack (alignment: .leading) {
                    
                    Text(rewardDetail.title)
                        .font(.largeTitle)
                        .fontWeight(.semibold)

                    
                    Text(rewardDetail.company)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("mobilixGreen"))
//                        .padding(.top, 1)
                    
                                        
                    Text(verbatim: "Pour en profiter,")
                        .font(.title3)
                        .padding(.top, 1)
                    
                    HStack  {
                        Text(verbatim: "tu as besoin de")
                            .font(.title3)
                        
                        Text(String(rewardDetail.neededPoints))
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("points")
                            .font(.title3)
                    }
                    
                    
                    Text(rewardDetail.detail)
                        .lineSpacing(3)
                        .padding(EdgeInsets(
                            top: 24,
                            leading: 0,
                            bottom: 10,
                            trailing: 0))
                    //                    .multilineTextAlignment(.center)
                }
                .padding(EdgeInsets(
                    top: 20,
                    leading: 30,
                    bottom: 30,
                    trailing: 30))
                
                
                // ------------ Button désactivé lorsqu'il manque des points
                
                if currentPoints <= rewardDetail.neededPoints {
                    Button {
                        //
                    } label: {
                        Text("Il te manque des points")
                    }
                    .disabled(deactivateButton == true)
                    .buttonStyle(.borderedProminent)
                    .tint(Color("mobilixGreen"))
                    .controlSize(.large)
                    //                .padding()
                    
                    // ------------ Button lorsqu'il y a assez de points 
                    
                } else {
                    Button {
                        showConfirmation = true
                    } label: {
                        Text("J'en profite maintenant")
                            .fontWeight(.bold)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color("mobilixGreen"))
                    .controlSize(.large)
                    //                .padding()
                    
                    
                    .confirmationDialog("Confirmer ?",
                                        isPresented: $showConfirmation) {
                        
                        Button("Oui, je confirme !") {
                            isConfirmed = true
                            currentPoints -= rewardDetail.neededPoints
                        }
                    } message: {
                        Text("Confirmes-tu ton choix ?")
                    }
                    
                    
            // ----------- Modal ----------------
                    .sheet(isPresented: $isConfirmed) {
                                            
                        VStack (spacing: 0){
                                                        
                            HStack {
                                Spacer()
                                
                                Button {
                                    isConfirmed = false
                                } label: {
                                    Text("Fermer")
                                        .foregroundColor(Color("mobilixGreen"))
                                        .padding(.trailing, 25)
                                }
                            }
                            .padding(.top, 30)
                            
                            Spacer()
                            
                            HStack {
                                
                                Text("Merci \(userProfil.name)")
 
        // ----------------- Hearts animation -----------------
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
                                
     // ----------------- end Hearts animation -----------------
                            
                                 
/*
                                    .scaleEffect(isAnimated ? 2 : 1)
                                    .onAppear() {
                                        withAnimation(.easeInOut(duration: 1).repeatForever()) {
                                            isAnimated = true
                                        }
                                    }
*/
 
                            }
                            .font(.title)
                            .padding(16)
                            
                            Spacer()
                                .frame(height: 35)
                            
                            
                            Text("""
                        Nous t'avons envoyé le bon d'échange par mail \(Image(systemName: "eyes"))
                        Si toutefois tu changes d'avis, tu as 3 jours pour annuler ton choix.
                        """)
                            .font(.title3)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(8)
                            .frame(width: 320)
//                            .padding(.leading, 8)
                                                        
                            Spacer()
                            
                            Text("Pour l'info, il te reste \(currentPoints) points \(Image(systemName: "face.smiling"))")
                                .foregroundColor(Color("darkGreen"))


                            
                            Spacer()
                        
                        }
                        .background(Color("mobilixGreen").opacity(0.08))
                        .edgesIgnoringSafeArea(.all)
                    } // end Modal
                    


                }
                
                
            } // end VStack
            .navigationBarTitle(rewardDetail.title)
            .padding(50)
        }
            
    } // end body
}

struct RewardView_Previews: PreviewProvider {
    static var previews: some View {
        RewardView(rewardDetail: beerJoe)
    }
}



