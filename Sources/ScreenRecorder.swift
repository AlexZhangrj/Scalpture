//
//  ScreenRecorder.swift
//  Scalpture
//
//  Created by Sendy Halim on 9/15/17.
//  Copyright © 2017 Sendy Halim. All rights reserved.
//

import AVFoundation

enum ScreenRecorderError: Error {
  case cannotAddScreenAsInput
  case cannotAddOutput
}

struct ScreenRecorder {
  let session = AVCaptureSession()
  let output: AVCaptureMovieFileOutput
  let input: AVCaptureScreenInput

  init(screen: Screen, fps: Int = 30) throws {
    input = AVCaptureScreenInput(displayID: CGMainDisplayID())
    input.minFrameDuration = CMTimeMake(1, Int32(fps))
    input.capturesCursor = screen.capturesCursor
    input.capturesMouseClicks = screen.capturesMouseClicks
    input.cropRect = screen.frame

    output = AVCaptureMovieFileOutput()

    // Needed because otherwise there is no audio on videos longer than 10 seconds
    // http://stackoverflow.com/a/26769529/64949
    output.movieFragmentInterval = kCMTimeInvalid
    
    if !session.canAddInput(input) {
      throw ScreenRecorderError.cannotAddScreenAsInput
    }
    
    if !session.canAddOutput(output) {
      throw ScreenRecorderError.cannotAddOutput
    }
    
    session.addInput(input)
    session.addOutput(output)
  }
    
  func record() {
    session.startRunning()
  }
}
