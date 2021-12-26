//
//  ColorModel.swift
//  Palette
//
//  Created by yjlee12 on 2021/12/24.
//

import Foundation

struct ColorPalette: Codable {
    var mode: String?
    var count: Int?
    var colors: [ColorComponent]?
}


struct ColorComponent: Codable {
    var hex : Hex?
    var rgb : RGB?
    var hsl : HSL?
    var hsv : HSV?
    var name : ColorName?
    var cmyk : CMYK?
    var xyz : XYZ?
    var image : ColorImage?
    var contrast : ColorContrast?
    var links: ColorLink?
    var embedded: String?
    
    enum CodingKeys: String, CodingKey {
        case hex, rgb, hsl, hsv, name, cmyk, xyz, image, contrast
        case links = "_links"
        case embedded = "_embedded"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.hex = try? values.decode(Hex.self, forKey: .hex)
        self.rgb = try? values.decode(RGB.self, forKey: .rgb)
        self.hsl = try? values.decode(HSL.self, forKey: .hsl)
        self.hsv = try? values.decode(HSV.self, forKey: .hsv)
        self.name = try? values.decode(ColorName.self, forKey: .name)
        self.cmyk = try? values.decode(CMYK.self, forKey: .cmyk)
        self.xyz = try? values.decode(XYZ.self, forKey: .xyz)
        self.image = try? values.decode(ColorImage.self, forKey: .image)
        self.contrast = try? values.decode(ColorContrast.self, forKey: .contrast)
        self.links = try? values.decode(ColorLink.self, forKey: .links)
        self.embedded = try? values.decode(String.self, forKey: .embedded)
        

    }
}


struct Hex: Codable {
    var value: String?
    var clean: String?
}

struct RGB: Codable {
    var r: Int?
    var g: Int?
    var b: Int?
    var fraction: FractionRGB?
    var value: String?
}

struct FractionRGB: Codable {
    var r : Double?
    var g : Double?
    var b : Double?
}

struct HSL: Codable {
    var h : Int?
    var s : Int?
    var l : Int?
    var fraction: FractionHSL?
    var value: String?
}

struct FractionHSL: Codable {
    var h : Double?
    var s : Double?
    var l : Double?
}

struct HSV: Codable {
    var h: Int?
    var s: Int?
    var v: Int?
    var fraction: FractionHSV?
    var value: String?
}

struct FractionHSV: Codable {
    var h : Double?
    var s : Double?
    var v : Double?
}

struct CMYK: Codable {
    var c: Int?
    var m: Int?
    var y: Int?
    var k: Int?
    var fraction: FractionCMYK?
    var value: String?
}

struct FractionCMYK: Codable {
    var c: Double?
    var m: Double?
    var y: Double?
    var k: Double?
}

struct XYZ: Codable {
    var x: Int?
    var y: Int?
    var z: Int?
    var fraction: FractionXYZ?
    var value: String?
}

struct FractionXYZ: Codable {
    var x: Double?
    var y: Double?
    var z: Double?
}

struct ColorImage: Codable {
    var bare: String?
    var named: String?
}

struct ColorContrast: Codable {
    var value: String?
}

struct ColorLink: Codable {
    var `self`: [String : String]
}


struct ColorName: Codable {
    var value: String?
    var closestNamedHex: String?
    var exactMatchName: String?
    var distance: Int?
    
    enum CodingKeys: String, CodingKey {
        case closestNamedHex = "closest_named_hex"
        case exactMatchName = "exact_match_name"
        case value
        case distance
    }
}
