module NumbersAndWords
  module I18n
    module Plurals
      module Pl
        module_function

        RULE = lambda do |n|
          if one_conditions(n)
            :one
          elsif few_conditions(n)
            :few
          elsif many_conditions(n)
            :many
          else
            :other
          end
        end

        def one_conditions(n)
          n % 10 == 1 && n % 100 != 11 && n % 100 != 21
        end

        def few_conditions(n)
          [2, 3, 4].include?(n % 10) && ![12, 13, 14].include?(n % 100)
        end

        def many_conditions(n)
          (n % 10).zero? || [5, 6, 7, 8, 9].include?(n % 10) || [11, 12, 13, 14, 21].include?(n % 100)
        end
      end
    end
  end
end
