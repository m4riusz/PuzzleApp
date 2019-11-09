//
//  PuzzleMapForm.swift
//  PuzzleApp
//
//  Created by Mariusz Sut on 23/10/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import SwiftUI

struct PuzzleMapForm: View {
    @ObservedObject var viewModel: PuzzleMapFormViewModel
    @State var isPresentingPicker: Bool = false
    @State var isPresentingPickerOptions: Bool = false
    @State var pickerType: UIImagePickerController.SourceType = .camera
    
    var body: some View {
        Form {
            Section(header: FormSectionTitle(text: "Name")) {
                TextField("", text: self.$viewModel.name)
            }
            Section(header: FormSectionTitle(text: "Number of rows")) {
                FormSliderView(minValue: .constant(self.viewModel.minNumberOfRows),
                               maxValue: .constant(self.viewModel.maxNumberOfRows),
                               currentValue: self.$viewModel.numberOfRows)
            }
            Section(header: FormSectionTitle(text: "Number of columns")) {
                FormSliderView(minValue: .constant(self.viewModel.minNumberOfColumns),
                               maxValue: .constant(self.viewModel.maxNumberOfColumns),
                               currentValue: self.$viewModel.numberOfColumns)
            }
            Section(header: FormSectionTitle(text: "Image")) {
                FormImagePickerView(text: self.viewModel.image == nil ? "Pick" : "Change",
                                    action: { self.isPresentingPickerOptions.toggle() },
                                    image: self.$viewModel.image)
            }
            Section {
                FormButton(text: "Save",
                           color: .systemBlue,
                           enabled: self.viewModel.isFormValid) {
                            self.viewModel.updateOrCreate()
                }
                if !self.viewModel.operationType.isCreateOption() {
                    FormButton(text: "Delete",
                               color: .systemRed,
                               enabled: true) {
                                self.viewModel.delete()
                    }
                }
            }
            .modifier(AdaptsToSoftwareKeyboard())
            .navigationBarTitle(Text(self.viewModel.operationType.isCreateOption() ? "Create map" : "Edit map"),
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
                                    image: self.$viewModel.image)
                })
        }
    }
}

struct MapForm_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleMapForm(viewModel: .init(puzzleMapRepository: PuzzleMapRepository(),
                                       operationType: .create))
    }
}
