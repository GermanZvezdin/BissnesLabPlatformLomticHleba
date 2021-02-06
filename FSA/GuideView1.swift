//
//  GuideView1.swift
//  FSA
//
//  Created by German Zvezdin on 06.02.2021.
//

import SwiftUI
import AVKit

struct GuideView1: View {
    @State var player = AVPlayer(url:  URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!)
    var body: some View {
        ZStack{
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color.init(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(30.0)
                .frame(width: UIScreen.main.bounds.width - 15,height: 300)
            VStack{
                Spacer()
                Text("Как правильно оформить бизнес идею ?")
                    .bold()
                    .padding(.top, 10)
                    .font(.system(size: 30))
                    .frame(width: UIScreen.main.bounds.size.width - 30,alignment: .leading)
               

                VideoPlayer(player: player) {
                    
                }.cornerRadius(20.0)
                .frame(width: UIScreen.main.bounds.width - 60, height: 200, alignment: .center)
                .padding(.top, 10)
                .padding(.bottom, 10)
                .onAppear{
                    player.play()
                }
                
                
                
                Spacer()
            }
        }
    }
}

struct GuideView1_Previews: PreviewProvider {
    static var previews: some View {
        GuideView1()
    }
}
