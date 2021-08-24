//
//  Home.swift
//  Home
//
//  Created by nyannyan0328 on 2021/08/24.
//

import SwiftUI

struct Home: View {
    @State var post : [Post] = []
    @State var columns : Int = 2
    @Namespace var animation
    var body: some View {
        NavigationView{
            
            ScrollRefleshable(tintColor: .red, title: "Reflesh", content: {
                
                StaggGrid(columns: columns, list: post) {post in
                    
                    
                    
                CardView(post: post)
                        .matchedGeometryEffect(id: post.id, in: animation)
                    
                    
                }
                .padding(.horizontal)
                
            }, onReflesh: {
                
                await Task.sleep(2_000_000_000)
                
            })
            .navigationTitle("StaggGrid")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    
                    ControlGroup{
                        
                        HStack{
                            
                            Button {
                                
                                columns += 1
                                
                            } label: {
                                Image(systemName: "plus")
                                    .font(.caption.bold())
                                    .foregroundColor(.white)
                                    .padding(9)
                                    .background(.black,in: Circle())
                                   
                                
                            }
                         
                            
                            Button {
                                
                                columns = max(columns - 1, 1)
                                
                                
                            } label: {
                                Image(systemName: "minus")
                                    .font(.caption.bold())
                                    .foregroundColor(.white)
                                    .padding(13)
                                    .background(.black,in: Circle())
                                 
                                    
                                
                            }
                        
                            
                            
                            
                        }
                        .padding(.leading,10)
                     
                    
                    }
                    .controlGroupStyle(.navigation)
                   
                
                    
                    
                }
            
            }
            .animation(.linear, value: columns)
            
        }
        .onAppear {
            for index in 1...10{
                
                
                post.append(Post(imageURL: "p\(index)"))
                
            }
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct CardView : View{
    
    var post : Post
    
    var body: some View{
        
        Image(post.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
        
    }
}
