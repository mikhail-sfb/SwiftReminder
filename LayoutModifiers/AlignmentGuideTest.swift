//
//  AlignmentGuide.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

struct AlignmentGuideTest: View {
    var body: some View {
        VStack {
            HStack {
                // computeValue - offset
                // MARK: Offset and alignmentGuide, first one move the CONTENT, second one move the frame of the view
                Image(systemName: "person.crop.circle")
                    .alignmentGuide(VerticalAlignment.center, computeValue: {_ in 20})
                Image(systemName: "person.crop.circle")
                    .alignmentGuide(VerticalAlignment.center, computeValue: {_ in 0})
                Image(systemName: "person.crop.circle")
                    .alignmentGuide(VerticalAlignment.center, computeValue: {_ in -20})
            }
            
            VStack {
                Image(systemName: "person.crop.circle")
                    .alignmentGuide(HorizontalAlignment.center, computeValue: {_ in 20})
                Image(systemName: "person.crop.circle")
                    .alignmentGuide(HorizontalAlignment.center, computeValue: {_ in 0})
                Image(systemName: "person.crop.circle")
                    .alignmentGuide(HorizontalAlignment.center, computeValue: {_ in -20})
            }
        }
    }
}

#Preview {
    AlignmentGuideTest()
}
