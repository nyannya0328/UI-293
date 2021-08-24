//
//  StaggGrid.swift
//  StaggGrid
//
//  Created by nyannyan0328 on 2021/08/24.
//

import SwiftUI

struct StaggGrid<Content : View,T : Identifiable>: View  where T : Hashable{
    
    var content : (T) -> Content
    var list : [T]
    
    var showIndicator : Bool
    var spacing : CGFloat
    var columns : Int
    
    init(columns : Int,showIndicator : Bool = false,spacing : CGFloat = 10,list : [T],@ViewBuilder content : @escaping(T)->Content) {
        
        self.columns = columns
        self.spacing = spacing
        self.showIndicator = showIndicator
        self.list = list
        self.content = content
        
    }
    
    func setUpList() -> [[T]]{
        
        var gridArray : [[T]] = Array(repeating: [], count: columns)
        
        
        var currentIndex : Int = 0
        
        for object in list{
            gridArray[currentIndex].append(object)
            
            if currentIndex == (columns - 1){currentIndex = 0}
            
            else{
                
                currentIndex += 1
            }
            
            
            
            
        }
        
        return gridArray
        
        
        
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: showIndicator) {
            
            HStack(alignment:.top){
                
                
                ForEach(setUpList(),id:\.self){currentIndeex in
                    
                    LazyVStack(spacing:spacing){
                        
                        ForEach(currentIndeex){object in
                            
                            
                            content(object)
                        }
                    }
                    
                    
                }
                
          
            }
        
            
        }
    }
}

struct StaggGrid_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
