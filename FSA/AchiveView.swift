//
//  AchiveView.swift
//  FSA
//
//  Created by German Zvezdin on 05.02.2021.
//

import SwiftUI

struct AchiveView: View {
    var body: some View {
        NavigationView(){
            Form{
                HStack{
                    Image("achive1")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding(Edge.Set.trailing, 65)
                    Text("Описание")
                    
                }
                HStack{
                    Image("achive2")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding(Edge.Set.trailing, 65)
                    Text("Описание")
                    
                }
                HStack{
                    Image("achive3")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding(Edge.Set.trailing, 65)
                    Text("Описание")
                    
                }
                HStack{
                    Image("achive5")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding(Edge.Set.trailing, 65)
                    Text("Описание")
                    
                }
                HStack{
                    Image("achive1")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding(Edge.Set.trailing, 65)
                    Text("Описание")
                    
                }
                HStack{
                    Image("achive2")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding(Edge.Set.trailing, 65)
                    Text("Описание")
                    
                }
                HStack{
                    Image("achive3")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding(Edge.Set.trailing, 65)
                    Text("Описание")
                    
                }
                HStack{
                    Image("achive5")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding(Edge.Set.trailing, 65)
                    Text("Описание")
                    
                }
                
            }
            .navigationBarTitle("Достижения")
        }
    }
}

struct AchiveView_Previews: PreviewProvider {
    static var previews: some View {
        AchiveView()
    }
}
