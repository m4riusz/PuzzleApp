//
//  PuzzleMapForm.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 23/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct PuzzleMapForm: View {
    
    @ObservedObject var puzzleMapFormViewModel: PuzzleMapFormViewModel
    @State var isPresentingPicker: Bool = false
    @State var isPresentingPickerOptions: Bool = false
    @State var pickerType: UIImagePickerController.SourceType = .camera
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: FormSectionTitle(text: "Name")) {
                    TextField("", text: self.$puzzleMapFormViewModel.name)
                }
                Section(header: FormSectionTitle(text: "Number of rows")) {
                    FormSliderView(minValue: self.$puzzleMapFormViewModel.minNumberOfRows,
                                   maxValue: self.$puzzleMapFormViewModel.maxNumberOfRows,
                                   currentValue: self.$puzzleMapFormViewModel.numberOfRows)
                }
                Section(header: FormSectionTitle(text: "Number of columns")) {
                    FormSliderView(minValue: self.$puzzleMapFormViewModel.minNumberOfColumns,
                                   maxValue: self.$puzzleMapFormViewModel.maxNumberOfColumns,
                                   currentValue: self.$puzzleMapFormViewModel.numberOfColumns)
                }
                Section(header: FormSectionTitle(text: "Image")) {
                    FormImagePickerView(text: "Pick",
                                        action: { self.isPresentingPickerOptions.toggle() },
                                        image: self.$puzzleMapFormViewModel.image)
                }
                Section {
                    FormSubmitButton(text: "Save",
                                     enabled: self.puzzleMapFormViewModel.isFormValid) {
                                        
                    }
                }
            }
            .modifier(AdaptsToSoftwareKeyboard())
            .navigationBarTitle(Text("Map form"))
            .actionSheet(isPresented: self.$isPresentingPickerOptions, content: {
                ActionSheet(title: Text("Image source"),
                            buttons: [
                                .default(Text("Camera")) {
                                    self.pickerType = .camera
                                    self.isPresentingPicker.toggle()
                                },
                                .default(Text("Library")) {
                                    self.pickerType = .photoLibrary
                                    self.isPresentingPicker.toggle()
                                },
                                .cancel()
                ])
            }).sheet(isPresented: self.$isPresentingPicker, content: {
                ImagePickerView(source: self.pickerType,
                                isPresented: self.$isPresentingPicker,
                                image: self.$puzzleMapFormViewModel.image)
            })
        }
    }
}

struct MapForm_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleMapForm(puzzleMapFormViewModel: PuzzleMapFormViewModel())
    }
}