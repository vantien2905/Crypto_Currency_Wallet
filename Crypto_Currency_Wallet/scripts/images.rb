require 'fileutils'

PROJECT_DIR_NAME = "Crypto_Currency_Wallet"
ASSETS_DIR = File.join(Dir.pwd, "../", PROJECT_DIR_NAME, "Assets.xcassets")
BUNDLE_ID = "ch.resource.vn.Crypto-Currency-Wallet"
puts "ASSETS_DIR is #{ASSETS_DIR}"

puts "Create file images in #{ASSETS_DIR}"

IMG_VALUE = "\r\n"
CURRENT_PATH = Dir.pwd;

Dir.chdir(ASSETS_DIR)
Dir["**/*.imageset"].map{ |f| File.basename(f, ".*") }.sort.select { |f|
    if f != "AppIcon"
        IMG_VALUE << "\tcase #{f}\r\n"
    end
}

IMAGE_DATA = 
"//
//  IMG.swift
//
//  Auto Created by images.rb
//
//

import UIKit

enum IMG: String {
    #{IMG_VALUE}
}

extension IMG {
    var image: UIImage? {
        return UIImage(named: self.rawValue, in: Bundle(identifier: \"#{BUNDLE_ID}\"), compatibleWith: nil)
    }
}
"

puts "Generate code done"
IMG_FILE_CODE_NAME = "IMG.swift"
IMG_FILE_PATH = File.join(CURRENT_PATH, "..", PROJECT_DIR_NAME, "Resources", IMG_FILE_CODE_NAME)
puts "Create or Updated files #{IMG_FILE_PATH}"

File.open(IMG_FILE_PATH, "a") do |f| 
    puts "Clean File #{IMG_FILE_CODE_NAME}"
    f.truncate(0)

    f.write(IMAGE_DATA)
end

puts "Created or Updated #{IMG_FILE_CODE_NAME} succeed at #{IMG_FILE_PATH}"
