//
//  UIColor+Extensions.swift
//
//  Created by chicketen on 2015/07/26.
//  Copyright (c) 2015年 chicketen. All rights reserved.
//

import UIKit

public extension UIColor {
  
  /**
  Int形式でUIColorを作成する。
  
  :returns: 作成されたUIColorを返す。
  */
  static public func colorWithInt(#r: Int, g: Int, b: Int) -> UIColor {
    return UIColor(
      red: CGFloat(r) / 255.0,
      green: CGFloat(g) / 255.0,
      blue: CGFloat(b) / 255.0,
      alpha: 1.0)
  }
  
  /**
  Int形式でUIColorを作成する。(alpha指定あり)
  
  :returns: 作成されたUIColorを返す。
  */
  static public func colorWithInt(#r: Int, g: Int, b: Int, a: Int) -> UIColor {
    return UIColor(
      red: CGFloat(r) / 255.0,
      green: CGFloat(g) / 255.0,
      blue: CGFloat(b) / 255.0,
      alpha: CGFloat(a) / 255.0)
  }
  
  /**
  RRGGBB形式の文字列をUIColorに変換する。
  
  :returns: 変換されたUIColorを返す。文字列が不正な場合はnilを返す。
  */
  static public func colorWithRGBString(str: String) -> UIColor? {
    var rgb = str
    if rgb.hasPrefix("#") && count(rgb) > 1 {
      rgb = rgb.substringWithBeginIndex(1)!
    }
    
    if count(rgb) != 6 {
      return nil
    }
    
    if let value = rgb.scanHexInt() {
      let r = (value >> 16) & 0xff
      let g = (value >>  8) & 0xff
      let b =  value        & 0xff
      
      return UIColor.colorWithInt(r: r, g: g, b: b)
    } else {
      return nil
    }
  }
  
  /**
  RRGGBBAA形式の文字列をUIColorに変換する。
  
  :returns: 変換されたUIColorを返す。文字列が不正な場合はnilを返す。
  */
  static public func colorWithRGBAString(str: String) -> UIColor? {
    var rgb = str
    if rgb.hasPrefix("#") && count(rgb) > 1 {
      rgb = rgb.substringWithBeginIndex(1)!
    }
    
    if count(rgb) != 8 {
      return nil
    }
    
    if let value = rgb.scanHexInt() {
      let r = (value >> 24) & 0xff
      let g = (value >> 16) & 0xff
      let b = (value >>  8) & 0xff
      let a =  value        & 0xff
      
      return UIColor.colorWithInt(r: r, g: g, b: b, a: a)
    } else {
      return nil
    }
  }
}
