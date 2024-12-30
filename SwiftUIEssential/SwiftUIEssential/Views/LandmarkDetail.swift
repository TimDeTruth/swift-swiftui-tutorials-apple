//
//  LandmarkDetail.swift
//  SwiftUIEssential
//
//  Created by Timmy Lau on 2024-12-16.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @Environment(ModelData.self) var modelData

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    var landmark: Landmark
    
    
    var body: some View {
        @Bindable var modelData = modelData

        
        ScrollView {
            
            MapView(coordinates: landmark.locationCoordinates)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading, content: {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            })
            .padding()
            //            Spacer()
            
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
//    LandmarkDetail(landmark: landmarks[0])
//    LandmarkDetail(landmark: ModelData().landmarks[0])
    
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0]).environment(modelData)
}
