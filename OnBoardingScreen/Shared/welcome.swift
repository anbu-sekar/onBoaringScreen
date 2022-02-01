//
//  welcome.swift
//  OnBoardingScreen
//
//  Created by Anbusekar Murugesan on 17/12/2021.
//

import SwiftUI

struct welcome: View {
    
    @AppStorage("currentPage") var currentpage = 1
    
    var body: some View {
        walkThrough()
//        if currentpage > totalPages {
//            walkThrough()
//        } else {
//            home()
//        }
    }
}

struct welcome_Previews: PreviewProvider {
    static var previews: some View {
        welcome()
    }
}

// Home Screen
struct home: View {
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
            Text("Wolcome to Home!")
                .font(.title)
                .fontWeight(.heavy)
            
        }

       
            
    }
}

// Walkthrought Screen

struct walkThrough: View {
    
    @AppStorage("currentPage") var currentpage = 1

    
    var body: some View {
        // For slide animation
        ZStack {
            
                if currentpage == 1 {
                    ScreenView(image: "welcome3", title: "Step 1", detail: "", bgColor: Color("violet"))
                        .transition(.identity)
                }
            if currentpage == 2 {
                ScreenView(image: "welcome2", title: "Step 2", detail: "", bgColor: Color("yellow"))
                    .transition(.identity)
            }
            if currentpage == 3 {
                ScreenView(image: "welcome", title: "Step 3", detail: "", bgColor: Color("green"))
                        .transition(.identity)
            }
            if currentpage == 4 {
                ScreenView(image: "welcome2", title: "Step 4", detail: "", bgColor: Color("yellow"))
                        .transition(.identity)
            }
            
        }
        .overlay(
        
            Button(action: {
                withAnimation(.easeOut) {
                    if currentpage < totalPages {
                        currentpage += 1
                    } else {
                        currentpage = 1
                    }
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(.white)
                    .clipShape(Circle())
                
                    .overlay(
                        ZStack {
                            Circle()
                                .stroke(Color.black.opacity(0.04), lineWidth: 4)
                                
                                Circle()
                                .trim(from: 0, to: CGFloat(currentpage) / CGFloat(totalPages))
                                .stroke(.white, lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                            
                        }
                            .padding(-15)
                    )

                   
            })
                .padding(.bottom, 20)
            ,alignment: .bottom
        //button
        )
    }
}

struct ScreenView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("currentPage") var currentpage = 1
    var body: some View {
        VStack(spacing: 20) {
            HStack {
               
                if currentpage == 1 {
                    Text("Helloe Member!!!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                } else {
                    Button(action: {
                        withAnimation(.easeOut) {
                            currentpage -= 1
                        }
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    }
                }
                Spacer()
                Button(action: {
                    currentpage = 5
                }) {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.3)
                    
                }
                
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(title)
                . font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            
            Text("It is a long established fact that a reader will be distracted")
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
            
            
            Spacer(minLength: 120)
        }
        .background(bgColor.cornerRadius(10).ignoresSafeArea())
    }
}

var totalPages = 4
