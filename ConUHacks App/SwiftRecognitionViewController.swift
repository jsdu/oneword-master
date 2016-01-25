//
//  SwiftRecognitionViewController.swift
//  ClarifaiApiDemo
//

import UIKit
import ALCameraViewController
import Foundation
/**
 * This view controller performs recognition using the Clarifai API.
 */
class SwiftRecognitionViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet var cam: UIImageView!
    
    @IBOutlet var congratsMsg: UILabel!
    
    @IBOutlet var pointsMsg: UILabel!
    
    @IBOutlet var tagsMsg: UILabel!
    
    
    @IBOutlet var wordOfTheDay: UILabel!
    
    @IBOutlet var takePicture: UIButton!
    
    @IBOutlet var submitButton: UIButton!
    
    
    @IBOutlet var didNotMatch: UILabel!
    
    @IBOutlet var pleaseTryAgain: UILabel!
    
    var imageArr: [UIImage] = []
    
    
    var cameraDisplay: Bool = true
    // IMPORTANT NOTE: you should replace these keys with your own App ID and secret.
    // These can be obtained at https://developer.clarifai.com/applications
    static let appID = "vM05qo55uhZard2dL4BixmMm4WsHIl6CsGCTgS_7"
    static let appSecret = "rx4oPPiXiCWNRVcoJ0huLz02cKiQUZtq5JPVrhjM"

    // Custom Training (Alpha): to predict against a custom concept (instead of the standard
    // tag model), set this to be the name of the concept you wish to predict against. You must
    // have previously trained this concept using the same app ID and secret as above. For more
    // info on custom training, see https://github.com/Clarifai/hackathon
    static let conceptName: String? = nil
    static let conceptNamespace = "default"

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!

    private lazy var client : ClarifaiClient = {
        let c = ClarifaiClient(appID: appID, appSecret: appSecret)
        // Uncomment this to request embeddings. Contact us to enable embeddings for your app:
        // c.enableEmbed = true
        return c
    }()

    @IBAction func buttonPressed(sender: UIButton) {
        // Show a UIImagePickerController to let the user pick an image from their library.
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.allowsEditing = false
        picker.delegate = self
        presentViewController(picker, animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // The user picked an image. Send it Clarifai for recognition.
            imageView.image = image
            textView.text = "Recognizing..."
            recognizeImage(image)
        }
    }
    
    private func recognizeImage(image: UIImage!) {
        
        // Scale down the image. This step is optional. However, sending large images over the
        // network is slow and does not significantly improve recognition performance.
        let size = CGSizeMake(320, 320 * image.size.height / image.size.width)
        UIGraphicsBeginImageContext(size)
        image.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        // Encode as a JPEG.
        let jpeg = UIImageJPEGRepresentation(scaledImage, 0.9)!

        if SwiftRecognitionViewController.conceptName == nil {
            // Standard Recognition: Send the JPEG to Clarifai for standard image tagging.
            client.recognizeJpegs([jpeg]) {
                (results: [ClarifaiResult]?, error: NSError?) in
                if error != nil {
                    print("Error: \(error)\n")
                    self.tagsMsg.text = "Sorry, there was an error recognizing your image."
                } else {
                    self.tagsMsg.text = "Tags:\n" + results![0].tags.joinWithSeparator(", ")
                    self.tagsMsg.text! += ". Powered by Clarifai API."
                    print ("WTF: \(self.tagsMsg.text!)")
                    
                    if (self.tagsMsg.text!.lowercaseString.rangeOfString("portrait") != nil) {
                        self.submitButton.hidden = true
                        self.takePicture.hidden = true
                        self.cam.hidden = true
                        self.imageView.hidden = true
                        //self.wordOfTheDay.hidden = true
                        self.didNotMatch.hidden = true
                        self.pleaseTryAgain.hidden = true
                        
                        if let tbc = self.tabBarController as? customData {
                            tbc.imageArray.insert(self.imageView.image!, atIndex: 0)
                            tbc.peopleArray.insert(self.imageView.image!, atIndex: 0)
                        }
                        self.submitButton.hidden = true
                        self.congratsMsg.hidden = false
                        self.tagsMsg.hidden = false
                        self.pointsMsg.hidden = false
                        //self.wordOfTheDay.hidden = false
                        self.imageView.image = nil
                    } else {
                        self.submitButton.hidden = true
                        self.imageView.image = nil
                        self.tagsMsg.hidden = false
                        self.didNotMatch.hidden = false
                        self.pleaseTryAgain.hidden = false
                    }
                }
                
            }
        } else {
            // Custom Training: Send the JPEG to Clarifai for prediction against a custom model.
            client.predictJpegs([jpeg], conceptNamespace: SwiftRecognitionViewController.conceptNamespace, conceptName: SwiftRecognitionViewController.conceptName) {
                (results: [ClarifaiPredictionResult]?, error: NSError?) in
                if error != nil {
                    print("Error: \(error)\n")
                    self.tagsMsg.text = "Sorry, there was an error running prediction on your image."
                } else {
                    self.tagsMsg.text = "Prediction score for \(SwiftRecognitionViewController.conceptName!):\n\(results![0].score)"
                }
            }
        }
    }
    
    @IBAction func takePicture(sender: AnyObject) {
        
        let cameraViewController = ALCameraViewController(croppingEnabled: false, allowsLibraryAccess: true) { (image) -> Void in
            self.imageView.image = image
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        presentViewController(cameraViewController, animated: true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        if(imageView.image == nil) {
            submitButton.hidden = true
        }
        else {
            submitButton.hidden = false
        }
        takePicture.hidden = false
        cam.hidden = false
        imageView.hidden = false
        //wordOfTheDay.hidden = false
        
        tagsMsg.hidden = true
        pointsMsg.hidden = true
        congratsMsg.hidden = true
        
        didNotMatch.hidden = true
        pleaseTryAgain.hidden = true
        
    }
    

    
    
    @IBAction func submit(sender: AnyObject) {
        //textView.text = "Recognizing..."
        if (imageView.image != nil){
            recognizeImage(imageView.image)
        }
    }
    
    
}
