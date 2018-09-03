# frozen_string_literal: true

module Fetch
  class Equation < Base
    def perform
      super do |dataset|
        quantity = ::Quantity.find_by(name: dataset['quantity'])
        dataset['categories'].each do |category_dataset|
          handle_category(category_dataset, quantity)
        end
      end
    end

    private

    def handle_category(dataset, quantity)
      category_locals = dataset.delete('locals')
      title = dataset['title']
      dataset['equations'].each do |equation_dataset|
        handle_equation(equation_dataset, quantity, title, category_locals)
      end
    end

    def handle_equation(dataset, quantity, title, category_locals)
      locals = dataset.delete('locals')
      equation = find_or_create(dataset, quantity, title)
      update_translations(equation, locals, category_locals)
    end

    def find_or_create(dataset, quantity, title)
      dataset = { equation: dataset['equation'], title: title,
                  conditions: dataset['conditions'], quantity: quantity }
      equation = ::Equation.find_by(equation: dataset[:equation],
                                    quantity: dataset[:quantity])
      if equation.present?
        equation.update!(dataset)
        equation
      else
        ::Equation.create!(dataset)
      end
    end

    def update_translations(equation, locals, category_locals)
      category_locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        translation[:conditions] = locals&.dig(locale, 'conditions')
        equation.update!(translation)
      end
    end

    def url
      'https://raw.githubusercontent.com/Phylator/data/master/equations.json'
    end
  end
end
