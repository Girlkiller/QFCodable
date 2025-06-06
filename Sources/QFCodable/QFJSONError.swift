//
//  QFJSONError.swift
//  QFCodable
//
//  Created by FengQIU on 2023/11/2.
//

//===----------------------------------------------------------------------===//
//
// This source file is based on the Swift.org open source project
//
// Copyright (c) 2014 - 2021 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import Foundation

enum QFJSONError: Swift.Error, Equatable {
    case cannotConvertInputDataToUTF8
    case unexpectedCharacter(ascii: UInt8, characterIndex: Int)
    case unexpectedEndOfFile
    case tooManyNestedArraysOrDictionaries(characterIndex: Int)
    case invalidHexDigitSequence(String, index: Int)
    case unexpectedEscapedCharacter(ascii: UInt8, in: String, index: Int)
    case unescapedControlCharacterInString(ascii: UInt8, in: String, index: Int)
    case expectedLowSurrogateUTF8SequenceAfterHighSurrogate(in: String, index: Int)
    case couldNotCreateUnicodeScalarFromUInt32(in: String, index: Int, unicodeScalarValue: UInt32)
    case numberWithLeadingZero(index: Int)
    case numberIsNotRepresentableInSwift(parsed: String)
    case singleFragmentFoundButNotAllowed
    case invalidUTF8Sequence(Data, characterIndex: Int)
}
