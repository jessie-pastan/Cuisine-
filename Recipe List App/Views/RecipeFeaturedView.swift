//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Jessie P on 4/24/23.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State private var isPresenting = false
    
    var body: some View {
        VStack {
            Text("Featured Recipe")
                .font(.largeTitle)
                .bold()
                .padding(.top,40)
            GeometryReader{geo in
                TabView{
                    ForEach(0..<model.recipes.count, id: \.self){ index in
                        if model.recipes[index].featured == true {
                            //create featured cards
                            Button(action: {
                                self.isPresenting = true
                            }, label: {
                                ZStack {
                                        Rectangle()
                                            .foregroundColor(.white)
                                        
                                        VStack(spacing: 0){
                                            Image(model.recipes[index].image)
                                                .resizable()
                                                .aspectRatio( contentMode: .fill)
                                                .clipped()
                                            Text(model.recipes[index].name)
                                                
                                                .padding(5)
                                        }
                                    }
                                
                            })
                            .sheet(isPresented: $isPresenting){
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                              .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                        .cornerRadius(10)
                                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y:5)
                            
                
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
            VStack {
                
                Text("Prepreration Time")
                    .bold()
                Text("1 HR")
                Text("Featured")
                    .bold()
                Text("Authentic, Exotic taste")
                
            }
        }
        
        
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
