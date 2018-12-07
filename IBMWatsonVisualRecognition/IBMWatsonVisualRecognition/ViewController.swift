//
//  ViewController.swift
//  IBMWatsonVisualRecognition
//
//  Created by Amarjit Singh on 12/7/18.
//  Copyright © 2018 Amarjit Singh. All rights reserved.
//

import UIKit
import VisualRecognitionV3
import SVProgressHUD

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var photoLibrary: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var uiLabels: Array<UILabel>?
    
    let apikey = IBMWatsonAPIKey.init().apiKey
    let version = "2018-07-11"
    
    let imagePicker = UIImagePickerController()
    var classificationResults : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        cameraButton.isEnabled = false
        photoLibrary.isEnabled = false
        SVProgressHUD.show()
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            
            imagePicker.dismiss(animated: true, completion: nil)
            
            let visualRecognition = VisualRecognition(version: version, apiKey: apikey)
            
            let imageData = image.jpegData(compressionQuality: 0.01)
            let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentURL.appendingPathComponent("tempImage.jpg")
            try? imageData?.write(to: fileURL, options: [])
            
            visualRecognition.classify(imagesFile: fileURL) { (classifiedImages, error) in
                let classes = classifiedImages?.result?.images.first?.classifiers.first?.classes
                
                self.classificationResults = []
                
                for index in 0..<classes!.count {
                    self.classificationResults.append(classes![index].className)
                }
                
                DispatchQueue.main.async {
                    for i in 0..<classes!.count{
                        if i > 4{
                            break
                        }
                        self.uiLabels![i].text = self.classificationResults[i]
                    }
                    self.cameraButton.isEnabled = true
                    self.photoLibrary.isEnabled = true
                    SVProgressHUD.dismiss()
                }
            }
        }
        else{
            print("Error")
        }
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func photoLibraryTapped(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
}
