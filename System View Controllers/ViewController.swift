//
//  ViewController.swift
//  System View Controllers
//
//  Created by Kadir Hocaoğlu on 24.08.2023.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    // MARK: - UI Elements
    @IBOutlet var imageView: UIImageView!
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {return}
        imageView.image = selectedImage
        dismiss(animated: true)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
    }
    
    // MARK: - Actions
    
    @IBAction func shareButtonTapped(_ button: UIButton)
    {
        guard let image = imageView.image else { return }
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityController, animated: true)
        
    }
    @IBAction func safariButtonTapped(_ button: UIButton)
    {
        if let url = URL(string: "https://bento.me/kadiirhocaoglu"){
            let safariController = SFSafariViewController(url: url)
            present(safariController, animated: true)
        }
        
    }
    @IBAction func photosButtonTapped(_ button: UIButton)
    {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let alertControler = UIAlertController(title: "Kaynak Seçin", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true)
        }
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true)
        }
        
        alertControler.addAction(cancelAction)
        alertControler.addAction(photoLibraryAction)
        alertControler.addAction(cameraAction)
         
        present(alertControler, animated: true, completion: nil)
        
    }
    @IBAction func emailButtonTapped(_ button: UIButton)
    {
        guard MFMailComposeViewController.canSendMail() else {return}
        let mailComposerViewController = MFMailComposeViewController()
        mailComposerViewController.delegate = self
        mailComposerViewController.setToRecipients(["kadiirhocaoglu@gmail.com"])
        mailComposerViewController.setSubject("Merhaba mail başlığı")
        mailComposerViewController.setMessageBody("Merhabalar mailin içeriği", isHTML: false)
        present(mailComposerViewController, animated: true)
        
    }

}


