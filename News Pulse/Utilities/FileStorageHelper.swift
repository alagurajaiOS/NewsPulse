//
//  FileStorageHelper.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

class FileStorageHelper  {
//    static var userDirectory: String {
//        return FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!.path
//    }
//    
//    static var documentDirectory: String {
//        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path
//    }
    
    
    static func temporaryFileURL(forFilename filename: String) -> URL {
        // Get the URL for the temporary directory and append the filename
        let tempDirectoryURL = FileManager.default.temporaryDirectory
        let fileURL = tempDirectoryURL.appendingPathComponent(filename)
        return fileURL
    }
    
//    static func createDraftFolder(name: String) -> URL? {
//        let url = URL.init(fileURLWithPath: FileStorageHelper.documentDirectory).appendingPathComponent(name)
//        // Ensure the output directory exists
//        do {
//            let fileManager = FileManager.default
//            if fileManager.fileExists(atPath: url.absoluteString){
//                print("TRUE")
//            } else{
//                print("FALSE")
//                try fileManager.createDirectory(at: url, withIntermediateDirectories: false, attributes: nil)
//            }
//            return url
//        } catch{
//            print("Error creating directory: \(error)")
//            return nil
//        }
//    }
    
//    static func makeURLWith(containerName: String, fileName: String = "") -> URL{
//        let url = URL.init(fileURLWithPath: FileStorageHelper.documentDirectory).appendingPathComponent(containerName)
//        if !fileName.isEmpty{
//            return url.appendingPathComponent(fileName)
//        } else{
//            return url
//        }
//        
//    }
    
//    static func createDirectory(with url: URL, fileName: String) -> URL? {
//        // Create a new folder URL inside the document directory
//        let newFolderUrl = url.appendingPathComponent(fileName)
//        let fileManager = FileManager.default
//        do {
//            // Check if the folder already exists
//            if !fileManager.fileExists(atPath: newFolderUrl.path) {
//                // If the folder doesn't exist, create it
//                try fileManager.createDirectory(at: newFolderUrl, withIntermediateDirectories: true, attributes: nil)
//                
//                print("Folder created at: \(newFolderUrl.path)")
//            } else {
//                // If the folder already exists, print a message
//                print("Folder already exists at: \(newFolderUrl.path)")
//            }
//            return newFolderUrl
//        } catch {
//            // Handle any errors that occur during the folder creation
//            print("Error creating folder: \(error.localizedDescription)")
//            return nil
//        }
//    }
    
//    static func deleteFolder(at folderURL: URL) {
//        let fileManager = FileManager.default
//
//        do {
//            try fileManager.removeItem(at: folderURL)
//            print("Folder deleted successfully")
//        } catch {
//            print("Error deleting folder: \(error.localizedDescription)")
//        }
//    }
//    
//    static func deleteFile(at fileURL: URL) {
//        let fileManager = FileManager.default
//        let filePath = fileURL.path
//        
//        do {
//            // Check if file exists at the given path
//            if fileManager.fileExists(atPath: filePath) {
//                // Attempt to delete the file
//                try fileManager.removeItem(at: fileURL)
//                print("File deleted successfully")
//            } else {
//                print("File not found at path: \(filePath)")
//            }
//        } catch {
//            print("Error deleting file: \(error)")
//        }
//    }
//    
//    static func fetchAllFileURLs(in folderURL: URL) -> [URL]? {
//        let fileManager = FileManager.default
//        do {
//            // Get the contents of the folder
//            let fileURLs = try fileManager.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil)
//            return fileURLs
//        } catch {
//            print("Error while fetching files: \(error)")
//            return nil
//        }
//    }
//    
//    static func renameVideoFile(at fileURL: URL, to newName: String) {
//        let fileManager = FileManager.default
//        let originURL = fileURL
//        
//        // Construct new URL with the new file name
//        let directory = originURL.deletingLastPathComponent()
//        let newURL = directory.appendingPathComponent(newName)
//        
//        do {
//            // Attempt to rename the file
//            try fileManager.moveItem(at: originURL, to: newURL)
//            print("File renamed successfully to \(newName)")
//        } catch {
//            print("Error renaming file: \(error)")
//        }
//    }
//    
//    static func pushNotificationInfoFileURL() -> URL {
//        return URL.init(fileURLWithPath: FileStorageHelper.userDirectory).appendingPathComponent("PushNotificationInfo").appendingPathExtension("cached")
//    }
}
