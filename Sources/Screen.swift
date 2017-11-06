//
//  Screen.swift
//  Scalpture
//
//  Created by Sendy Halim on 9/15/17.
//  Copyright © 2017 Sendy Halim. All rights reserved.
//

import Foundation

protocol Screen {
  var frame: CGRect { get }
  var capturesCursor: Bool { get }
  var capturesMouseClicks: Bool { get }
}
