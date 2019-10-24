//
//  ImagePickerView.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 24/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct ImagePickerView: UIViewControllerRepresentable {
    
    let source: UIImagePickerController.SourceType
    @Binding var isPresented: Bool
    @Binding var image: UIImage?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = self.source
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<ImagePickerView>) {
    }
    
    func makeCoordinator() -> ImagePickerView.Coordinator {
        return Coordinator(imagePickerView: self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        private let imagePickerView: ImagePickerView
        
        init(imagePickerView: ImagePickerView) {
            self.imagePickerView = imagePickerView
        }
        
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let selectedImage = info[.originalImage] as? UIImage else {
                self.imagePickerView.isPresented = false
                return
            }
            self.imagePickerView.image = selectedImage
            self.imagePickerView.isPresented = false
        }
        
    }
}
