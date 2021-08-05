//
//  MenuView.swift
//  MacMenu (iOS)
//
//  Created by David Amunga on 05/08/2021.
//

import SwiftUI

struct MenuView: View {
    //    For Slide Animation
    @Namespace var animation
    //    Current Tab....
    @State var currentTab = "Home"
    var body: some View {
        VStack{
            HStack{
                
                TabButton(title: "Home", currentTab: $currentTab,animation: animation)
                
                TabButton(title: "Help", currentTab: $currentTab,animation: animation)
                
            }
            .padding(.horizontal)
            .padding(.top)
            
            //            Divider...
            Divider()
                .padding(.top,4)
            
            Image("box")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            HStack{
                Text("Export your artboards...")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName:"square.and.arrow.up")
                        .foregroundColor(.primary)
                })
                
            }
            
            Spacer(minLength: 15)
            
            Divider()
                .padding(.bottom,2)
            
            //            Bottom View...
            HStack{
                Image("city")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                    .clipShape(Circle())
                
                Text("City")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.primary)
                
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName:"gearshape.fill")
                        .foregroundColor(.primary)
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            
        }
        //        Max menu Size
        //        your own Size
        .frame(width: 250, height: 300)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct TabButton:View{
    var title:String
    @Binding var currentTab: String
    var animation:Namespace.ID
    
    var body:some View{
        Button(action: {
            withAnimation{
                currentTab = title
            }
        }, label: {
            Text(title)
                .font(.callout)
                .fontWeight(.bold)
                .foregroundColor(currentTab == title ?
                                    .white : .primary
                )
                .padding(.vertical,4)
                .frame(maxWidth: .infinity)
                .background(
                    ZStack{
                        if currentTab == title{
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.blue)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }else{
                            // Primary Border...
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.primary,lineWidth: 0.6)
                        }
                    }
                )
                .contentShape(RoundedRectangle(cornerRadius: 4))
            
            
        }).buttonStyle(PlainButtonStyle())
    }
}
