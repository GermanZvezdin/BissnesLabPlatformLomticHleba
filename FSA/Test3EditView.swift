//
//  Test3EditView.swift
//  FSA
//
//  Created by German Zvezdin on 05.02.2021.
//

import SwiftUI

struct Test3EditView: View {
    @State var show_idea = false 
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            StickyHeader {
                        StickyHeader {
                            
                            Image("Owlcat")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .padding(Edge.Set.bottom, 60)
                        
                            
                                
                                
                                                
                            
                        }
                        
                    }
            
                Text("Owlcat Games")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
            Text(
"""
Московская студия разработки видеоигр была основана в 2016 году опытной командой — сотрудники Owlcat ранее работали, например, в студии Nival и участвовали в разработке таких блокбастеров, как «Аллоды Онлайн», «Проклятые земли», Heroes of Might and Magic V и Silent Storm.

Первый проект молодой студии оказался основан на франшизе Paizo Publishing — Pathfinder (серия настольных игр, похожих по правилам на Dungeons&Dragons). Средства на разработку привлекли от инвесторов, среди которых контролировавшая на тот момент Owlcat структура холдинга Mail.ru Group — My.com, а также посредством краудфандинга. В совокупности пользователи тогда пожертвовали на проект более $900 000. Правда, как рассказывал глава Owlcat Олег Шпильчевский, на разработку полноценной игры суммы все равно не хватило — поход к инвесторам был неизбежен.

На выходе получилась хитовая игра Pathfinder: Kingmaker. К разработке привлекли даже знаменитого геймдизайнера Криса Авеллона, участвовавшего в разработке серии Fallout. Один только лексикон героев превысил миллион слов. Релиз состоялся осенью 2018-го.

Owlcat не раскрывает данных о продажах. По данным сервиса SteamSpy, владельцами цифровых копий Patfinder: Kingmaker могут быть от 200 000 до 500 000 пользователей. Вместе с другим проектом (Dakar 18) Kingmaker помог издателю Deep Silver выручить $27,6 млн в ноябре 2018-го.

Новый проект Owlcat — продолжение первой игры. К моменту анонса студия успела отделиться от My.com и переехать из Москвы на Кипр. С «дочкой» Mail.ru Group компания сохранила партнерские отношения. My.com даже вложилась в новую игру уже как сторонний инвестор. Также среди инвесторов проекта — Gem Capital. Всего Owlcat удалось привлечь $1 млн.
""")
                    .frame(width: UIScreen.main.bounds.size.width - 20,height: 990, alignment: .leading)
                    .padding(Edge.Set.bottom, 10)
                
    
            Button(action: {
                self.show_idea.toggle()
            })
            {
                Text("Предложить идею")
                    .foregroundColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .font(.system(size: 20))
                    .bold()
            }
            .background(
                Rectangle()
                    .frame(width: 290, height: 45)
                    .foregroundColor(Color.init(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)))
                    .cornerRadius(20.0)
                    .animation(.spring())
            )
            .padding(Edge.Set.top, 90)
            .padding(Edge.Set.bottom, 50)
            .sheet(isPresented: $show_idea){
               CreateIdeaView()
            }
        }
    }
}

struct Test3EditView_Previews: PreviewProvider {
    static var previews: some View {
        Test3EditView()
    }
}
