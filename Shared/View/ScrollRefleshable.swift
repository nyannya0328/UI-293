//
//  ScrollRefleshable.swift
//  ScrollRefleshable
//
//  Created by nyannyan0328 on 2021/08/24.
//

import SwiftUI

struct ScrollRefleshable<Content : View>: View {
    
    var content : Content
    var tintColor : Color
    var title : String
    var onReflesh : () async ->()
    
    init(tintColor : Color, title : String,@ViewBuilder content : @escaping()->Content,onReflesh : @escaping() async ->()) {
        
        
        self.tintColor = tintColor
        self.title = title
        self.content = content()
        self.onReflesh = onReflesh
        
        
        UIRefreshControl.appearance().attributedTitle = NSAttributedString(string: title)
        
        UIRefreshControl.appearance().tintColor = UIColor(tintColor)
        
    }
    
    
    var body: some View {
        List{
            
            content
                .listItemTint(.clear)
                .listRowBackground(Color.purple)
                .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
        .listStyle(.plain)
        .refreshable {
            
         await   onReflesh()
            
        }
    }
}

struct ScrollRefleshable_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
