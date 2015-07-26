//
//  String+Extensions.swift
//
//  Created by chicketen on 2015/07/26.
//  Copyright (c) 2015年 chicketen. All rights reserved.
//

public extension String {
  public func substring(beginIndex: Int, endIndex: Int) -> String? {
    if beginIndex < 0 || beginIndex >= count(self) ||
        endIndex < 0 || endIndex >= count(self)+1 {
      return nil
    }
    
    let start = advance(self.startIndex, beginIndex)
    let end = advance(self.startIndex, endIndex)
    
    return self.substringWithRange(start..<end)
  }
  
  public func substring(beginIndex: Int) -> String? {
    return self.substring(beginIndex, endIndex: count(self))
  }
}