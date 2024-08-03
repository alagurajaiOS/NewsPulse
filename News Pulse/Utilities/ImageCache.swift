//
//  ImageCache.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit


class ImageCache {
    enum imageFetchError : Error {
        case imageNotFound
    }
    
    static let shared = ImageCache()
    private let cache = NSCache<NSString, UIImage>()
    
    
    init() {
        // Set the maximum memory size to 50 MB
        let megabyte = 1024 * 1024
        cache.totalCostLimit = 50 * megabyte
    }
    
    func getImageFromChache(withURL url: URL, completion: @escaping (Result<UIImage,imageFetchError>) -> Void) {
        if let cachedImage = cache.object(forKey: url.absoluteString as NSString) {
            
            DispatchQueue.main.async {
                completion(.success(cachedImage))
                return
            }
        } else if let cachedResult = loadImageFromTempDirectory(withURL: url){
            
            guard let cachedImage = cachedResult.image else {
                completion(.failure(imageFetchError.imageNotFound))
                return
            }
//            let modificationDate = cachedResult.modificationDate
            
            DispatchQueue.main.async {
                completion(.success(cachedImage))
                return
            }
        } else{
            completion(.failure(imageFetchError.imageNotFound))
            return
        }
    }
    
    func getImage(withUrl url: URL, completion: @escaping (UIImage?) -> Void) {
        // Check if the image is already in the cache
        if let cachedImage = cache.object(forKey: url.absoluteString as NSString) {
            
            DispatchQueue.main.async {
                completion(cachedImage)
                return
            }
            
            
        } else if let cachedResult = loadImageFromTempDirectory(withURL: url){
            
            let cachedImage = cachedResult.image
            let modificationDate = cachedResult.modificationDate
            
            DispatchQueue.main.async {
                completion(cachedImage)
                return
            }
            
        }
        
        // If not, download the image and store it in the cache
        
        var request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, _, _) in
            if let data = data, let downloadedImage = UIImage(data: data) {
                
                // Update the cache with image
                self.cache.setObject(downloadedImage, forKey: url.absoluteString as NSString)
                
                
                self.saveImageToTempDirectory(imageData: data, withURL: url)
                DispatchQueue.main.async {
                    completion(downloadedImage)
                }
                
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
        
    }
    
    
    func saveImageToTempDirectory(imageData: Data, withURL url: URL) {
        // Extract the last component (filename) from the URL
        let filename = url.lastPathComponent
        
        // Get the URL for the temporary directory and append the filename
        let tempFileURL = FileStorageHelper.temporaryFileURL(forFilename: filename)
        
        // Write the image data to the specified URL
        do {
            try imageData.write(to: tempFileURL)
        } catch {
            print("Error writing image data to file: \(error)")
        }
    }
    
    func loadImageFromTempDirectory(withURL url: URL) -> (image: UIImage?, modificationDate: Date?)? {
        // Extract the last component (filename) from the URL
        let filename = url.lastPathComponent
        
        // Get the URL for the temporary directory and append the filename
        let tempFileURL = FileStorageHelper.temporaryFileURL(forFilename: filename)
        
        do {
            // Read the image data from the specified URL
            let imageData = try Data(contentsOf: tempFileURL)
            let image = UIImage(data: imageData)
            
            
            // Get file attributes to retrieve the modification date
            let attributes = try FileManager.default.attributesOfItem(atPath: tempFileURL.path)
            let modificationDate = attributes[.modificationDate] as? Date
            
            //                    return (image: image, modificationDate: modificationDate)
            return(image: image, modificationDate: modificationDate)
            
            //            return image
        } catch {
            //            print("Error reading image data from file: \(error)")
            return nil
        }
    }
}
