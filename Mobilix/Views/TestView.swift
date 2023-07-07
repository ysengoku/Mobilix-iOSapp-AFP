//
//  TestView.swift
//  Mobilix
//
//  Created by Yuko SENGOKU on 07/05/2023.
//

import SwiftUI

/*
struct LikesGeometryEffect : GeometryEffect {
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


struct LikeTapModifier: ViewModifier {
    @State var time = 0.0
    let duration = 3.0
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .foregroundColor(Color("mobilixGreen"))
                .modifier(LikesGeometryEffect(time: time))
                .opacity(time == 3 ? 0 : 1)
        }
        .onAppear {
            withAnimation (.easeOut(duration: duration)) {
                self.time = duration
            }
        }
    }
}
*/






struct TestView: View {

 /*
    @State var hearts = 10
        
        func heartAction () {
            hearts += 5
        }
 */
    
    var body: some View {

        VStack {
            Spacer()
            Text("View pour des testes")
            Spacer()


/*
//            ZStack {
//                Color.black.ignoresSafeArea()
//                VStack {
//                    Spacer()
//                    HStack {
//                        Spacer()
                        ZStack {
                            
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .padding()
                                .onTapGesture {
                                    heartAction()
                                }
                            
                            ForEach (0..<hearts, id: \.self){ _ in
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .modifier(LikeTapModifier())
                                    .padding()
                            }
                            
                        }.foregroundColor(.white.opacity(0.5))
//                    }
//                }
//            }
 
*/

            
            Spacer()
        } // end VStack
        
    } // end body
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}




/*
            NavigationLink(
                        destination: SettingView(),
                        isActive: $changeView,
                        label: {
                            Button {
                                changeView = true
                                
                            
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    changeView = true
                                }
                                                                
                            }) {
                                Text("Tap Me")
                            }
                        })
*/
  
