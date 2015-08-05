//
//  String+Extensions.swift
//
//  Created by chicketen on 2015/07/26.
//  Copyright (c) 2015年 chicketen. All rights reserved.
//
import Foundation

public extension String {
  /**
  部分文字列を返す。
  
  :param: beginIndex 開始のインデックス
  :param: endIndex 終了のインデックス(これは含まない)
  :returns: 部分文字列。インデックスの指定が不正な場合はnilを返す。
  */
  public func substringWithBeginIndex(beginIndex: Int, endIndex: Int) -> String? {
    if beginIndex < 0 || beginIndex >= count(self) ||
        endIndex < 0 || endIndex >= count(self)+1 ||
        beginIndex > endIndex {
      return nil
    }
    
    let start = advance(self.startIndex, beginIndex)
    let end = advance(self.startIndex, endIndex)
    
    return self.substringWithRange(start..<end)
  }
  
  /**
  部分文字列を返す。
  
  :param: beginIndex 開始のインデックス
  :returns: 部分文字列。インデックスの指定が不正な場合はnilを返す。
  */
  public func substringWithBeginIndex(beginIndex: Int) -> String? {
    return self.substringWithBeginIndex(beginIndex, endIndex: count(self))
  }
  
  /**
  文字列を整数に変換する。
  
  :returns: 変換された整数。数字以外の文字が含まれている場合はnilを返す。
  */
  public func scanInt() -> Int? {
    var error: NSError?
    let regex = NSRegularExpression(pattern: "\\D+", options: .CaseInsensitive, error: &error)
    let matches = regex?.matchesInString(self, options: nil, range: NSMakeRange(0, count(self)))
    
    if matches?.count > 0 {
      return nil
    }
    
    var value: Int = 0
    NSScanner(string: self).scanInteger(&value)
    
    return value
  }

  /**
  16進文字列を整数に変換する。
  
  :returns: 変換された整数。16進数字以外の文字が含まれている場合はnilを返す。
  */
  public func scanHexInt() -> Int? {
    var error: NSError?
    var str = self
    
    if count(str) > 2 && str.hasPrefix("0x") {
      str = str.substringWithBeginIndex(2)!
    }
    
    let regex = NSRegularExpression(pattern: "[^0-9a-f]+", options: .CaseInsensitive, error: &error)
    let matches = regex?.matchesInString(str, options: nil, range: NSMakeRange(0, count(str)))
    
    if matches?.count > 0 {
      return nil
    }
    
    var value: UInt32 = 0
    NSScanner(string: str).scanHexInt(&value)
    
    return Int(value)
  }
  
  /**
  指定した部分文字列が最初に出現する位置のインデックスを返す。
  
  :returns: 該当する部分文字列のインデックス。該当しない場合は-1を返す。
  */
  public func indexOf(str: String) -> Int {
    let range = self.rangeOfString(str)
    if range != nil {
      let index = distance(self.startIndex, range!.startIndex)
      
      return index
    }
    return -1
  }
  
  /**
  指定した部分文字列が最後に出現する位置のインデックスを返す。
  
  :returns: 該当する部分文字列のインデックス。該当しない場合は-1を返す。
  */
  public func lastIndexOf(str: String) -> Int {
    let range = self.rangeOfString(str, options: NSStringCompareOptions.BackwardsSearch)
    if range != nil {
      let index = distance(self.startIndex, range!.startIndex)
      
      return index
    }
    return -1
  }
}