//
//  FacilityViewModel.swift
//  SFFluShotLocations
//
//  Created by Kunwar, Hari on 4/10/21.
//

import Foundation

struct FacilityViewModel {
    private let appointments: [FluAppointment]
    private var appointment: FluAppointment { appointments.first! }
    private let cellViewModels: [AppointmentCellViewModel]

    init?(appointments: [FluAppointment]) {
        guard !appointments.isEmpty else { return nil }
        self.appointments = appointments
        self.cellViewModels = appointments.map{ AppointmentCellViewModel($0) }
    }

    var facilityName: String? { appointment.facilityName }
    var eligibility: String? { appointment.eligibility }
    var address: String? {
        "\(appointment.street1 ?? ""), \(appointment.city ?? ""), \(appointment.postalCode ?? "")"
    }

    func numberOfRowsInSection(_ section: Int) -> Int {
        return cellViewModels.count
    }

    func cellViewModel(_ indexPath: IndexPath) -> AppointmentCellViewModel {
        return cellViewModels[indexPath.row]
    }
}
