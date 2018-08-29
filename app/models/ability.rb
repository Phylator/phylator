# frozen_string_literal: true

class Ability
  include CanCan::Ability
  include CanCanCan::System::Ability

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity
  def initialize(user)
    user ||= User.new
    modify [:create, :read, :update, :destroy]

    can :read, Category
    can :read, Pack
    can [:read, :create], Calculation
    abilities Calculation, user, public_abilities: false
    can [:read, :create], Calculation::Measurement
    can :manage, Calculation::Measurement do |measurement|
      measurement.calculation.user_id == user.id
    end
    can :read, Quantity do |quantity|
      quantity.pack.price.zero? || user.id && user.quantities.include?(quantity)
    end
    can :read, Constant do |constant|
      constant.pack.price.zero? || user.id && user.constants.include?(constant)
    end
    can :read, UnitOfMeasurement do |unit_of_measurement|
      if user.id && user.unit_of_measurements.include?(unit_of_measurement)
        true
      else
        free = false
        unit_of_measurement.quantities.each do |quantity|
          free = quantity.pack.price.zero?
          break if free
        end
        free
      end
    end
    can :read, Equation do |equation|
      equation.quantity.pack.price.zero? ||
        user.id && user.quantities.include?(equation.quantity)
    end
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity
end
