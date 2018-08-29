# frozen_string_literal: true

json.array! @units_of_measurement,
            partial: 'unit_of_measurements/unit_of_measurement',
            as: :unit_of_measurement
