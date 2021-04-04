//
//  FluShotLocation.swift
//  SFFluShotLocations
//
//  Created by Kunwar, Hari on 4/4/21.
//

import Foundation

struct FluShotLocation: Codable {
    let facilityName: String?
    let facilityID: String?
    let facilityType: String?
    let street1: String?
    let city: String?
    let state: String?
    let postalCode: String?
    let country: String?
    let latitude, longitude: String?
    let phone: String?
    let contact: String?
    let url: String
    let beginDate, endDate: String?
    let beginTime, endTime: String?
    let eligibility: String?
    let cost: String?
    let currencyCode: String?
    let notes: String?
}
