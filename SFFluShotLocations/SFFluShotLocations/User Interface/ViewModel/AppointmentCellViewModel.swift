//
//  AppointmentCellViewModel.swift
//  SFFluShotLocations
//
//  Created by Kunwar, Hari on 5/2/21.
//

import Foundation

struct AppointmentCellViewModel {
    private let appointment: FluAppointment

    init(_ appointment: FluAppointment) {
        self.appointment = appointment
    }

    var date: String? {
        return appointment.beginDate
    }

    var eligibility: String? {
        appointment.eligibility
    }

    var cost: String? {
        appointment.cost
    }
}
