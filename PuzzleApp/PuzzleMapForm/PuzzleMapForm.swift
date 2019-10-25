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
        Form {
            Section(header: FormSectionTitle(text: "Name")) {
                TextField("", text: self.$puzzleMapFormViewModel.name)
            }
            Section(header: FormSectionTitle(text: "Number of rows")) {
                FormSliderView(minValue: .constant(self.puzzleMapFormViewModel.puzzleSettings.minNumberOfRows),
                               maxValue: .constant(self.puzzleMapFormViewModel.puzzleSettings.maxNumberOfRows),
                               currentValue: self.$puzzleMapFormViewModel.numberOfRows)
            }
            Section(header: FormSectionTitle(text: "Number of columns")) {
                FormSliderView(minValue: .constant(self.puzzleMapFormViewModel.puzzleSettings.minNumberOfColumns),
                               maxValue: .constant(self.puzzleMapFormViewModel.puzzleSettings.maxNumberOfColumns),
                               currentValue: self.$puzzleMapFormViewModel.numberOfColumns)
            }
            Section(header: FormSectionTitle(text: "Image")) {
                FormImagePickerView(text: self.puzzleMapFormViewModel.image == nil ? "Pick" : "Change",
                                    action: { self.isPresentingPickerOptions.toggle() },
                                    image: self.$puzzleMapFormViewModel.image)
            }
            Section {
                FormButton(text: "Save",
                           color: .systemBlue,
                           enabled: self.puzzleMapFormViewModel.isFormValid) {
                            
                }
                if !self.puzzleMapFormViewModel.operationType.isCreateOption() {
                    FormButton(text: "Delete",
                               color: .systemRed,
                               enabled: true) {
                                
                    }
                }
            }
            .modifier(AdaptsToSoftwareKeyboard())
            .navigationBarTitle(Text(self.puzzleMapFormViewModel.operationType.isCreateOption() ? "Create map" : "Edit map"),
                                displayMode: .inline)
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
        PuzzleMapForm(puzzleMapFormViewModel:
            PuzzleMapFormViewModel(puzzleSettings: PuzzleSettings(minNumberOfRows: 4,
                                                                  maxNumberOfRows: 12,
                                                                  minNumberOfColumns: 4,
                                                                  maxNumberOfColumns: 12),
                                   operationType: .create(puzzleMap: PuzzleMap(id: 0,
                                                                               name: "",
                                                                               numberOfRows: 4,
                                                                               numberOfColumns: 4,
                                                                               image: nil,
                                                                               puzzles: []))))
    }
}
