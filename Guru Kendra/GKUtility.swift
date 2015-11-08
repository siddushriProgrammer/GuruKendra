//
//  GKUtility.swift
//  Guru Kendra
//
//  Created by Siddalingamurthy Gangadharappa on 11/6/15.
//  Copyright © 2015 Adroit. All rights reserved.
//

import Foundation

/**
 Master Detail State infers the rows in Master screen
 
 - GKUserEntryState: Used for User Sing In, Location Capture
 - GKGuestUserState: Limited Rows
 - GKLogedInUserState: Unlimited rows
 */
enum GKMasterDetailState {
    
     case GKUserEntryState
     case GKGuestUserState
     case GKLogedInUserState
    
}