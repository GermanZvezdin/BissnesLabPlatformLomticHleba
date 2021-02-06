//
//  AdminSettingView.swift
//  FSA
//
//  Created by German Zvezdin on 06.02.2021.
//

import SwiftUI

struct AdminSettingView: View {
    var body: some View {
        Button(action: {
            UserDefaults.standard.set(false, forKey: "admin")
            NotificationCenter.default.post(name:
                                                NSNotification.Name("adminChange"), object: nil)
        })
        {
            Text("Выйти из аккаунта")
                .font(.system(size: 20))
                .foregroundColor(Color.init(#colorLiteral(red: 1, green: 0.1830475948, blue: 0.1116173608, alpha: 1)))
        }
    }
}

struct AdminSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AdminSettingView()
    }
}
