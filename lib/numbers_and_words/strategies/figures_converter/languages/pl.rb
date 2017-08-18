module NumbersAndWords
  module Strategies
    module FiguresConverter
      module Languages
        class Pl < Base
          include Families::Latin

          def megs
            super({ number: @figures.number_in_capacity(@current_capacity) })
          end

          private

          def capacity_iteration
            words = []
            capacity_words = words_in_capacity(@current_capacity)
            words.push(megs) unless capacity_words.empty?
            words += capacity_words unless one?
            words
          end

          def one?
            words_in_capacity(@current_capacity) == [translations.ones(1)]
          end
        end
      end
    end
  end
end
