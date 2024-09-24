//
//  BookmarkView.swift
//  ApartmentsSwiftUI
//
//  Created by Азат Зиганшин on 03.09.2024.
//

import SwiftUI

struct BookmarkView: View {
    var body: some View {
        Button(action: {
            //
        }, label: {
            Rectangle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .overlay {
                    Image(systemName: "bookmark")
                }
        })
    }
}


#Preview {
    BookmarkView()
}
