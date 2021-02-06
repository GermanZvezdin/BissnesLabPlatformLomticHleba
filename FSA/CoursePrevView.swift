//
//  CoursePrevView.swift
//  FSA
//
//  Created by German Zvezdin on 05.02.2021.
//

import SwiftUI

struct CoursePrevView: View {
    @Binding var img: String
    @Binding var CourseName: String
    @Binding var CourseDisc: String
    @Binding var FCol: Color
    @Binding var Scol: Color
    
    var body: some View {
        ZStack{
           
            Rectangle()//Color.init( colorLiteral(red: 0.9979075789, green: 0.4746618271, blue: 0.07725875825, alpha: 1))
                .fill(LinearGradient(gradient: Gradient(colors: [FCol, Scol]), startPoint: .leading, endPoint: .trailing))
                .frame(width: UIScreen.main.bounds.width - 20, height: 120)
                .cornerRadius(20)
            HStack{
                Image(img)
                    .resizable()
                    .frame(width: 80, height: 80)
                    
                VStack(spacing: 7){
                    Text("\(self.CourseName)")
                        .bold()
                        .frame(maxWidth: 300, alignment: .leading)
                        .foregroundColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .font(.system(size: 20))
            
                    Text("\(self.CourseDisc)")
                        .frame(maxWidth: 300, alignment: .trailing)
                        .foregroundColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .font(.system(size: 14))
                }
            }
            
        }
    }
}

struct CoursePrevView_Previews: PreviewProvider {
    static var previews: some View {
        CoursePrevView(img: .constant("test2"), CourseName: .constant("Как заработать на автоматизации маркетинга"), CourseDisc: .constant("Курс от директоров Mindbox о том, зачем, когда и как автоматизировать маркетинг — и чтобы это еще окупилось"), FCol: .constant(Color.init(#colorLiteral(red: 1, green: 0.4718035953, blue: 0.07153818628, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.9979075789, green: 0.3464675098, blue: 0.1466082235, alpha: 1))))
    }
}
