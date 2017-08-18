module NumbersAndWords
  module Translations
    class Pl < Base
      include NumbersAndWords::Translations::Families::Base

      def zero(options = {})
        ones(0, options)
      end

      def ones(number, options = {})
        t([options[:prefix], :ones].join('.'))[number]
      end

      # for 20, 30, 60
      def tens(number, options = {})
        t([options[:prefix], :tens].join('.'))[number]
      end

      # for 12, 13, 19
      def teens(number_arr, options = {})
        t([options[:prefix], :teens].join('.'))[number_arr.first]
      end

      # for 42, 23, 69
      def tens_with_ones(numbers_arr, options = {})
        connector = ' '
        [tens(numbers_arr[1], options), connector, ones(numbers_arr[0], options)].join
      end

      def hundreds(number, options = {})
        t([options[:prefix], :hundreds].join('.'))[number]
      end

      def megs(capacity, options = {})
        number = options[:number]
        mega_name = "#{options[:prefix]}.mega"
        number ? t(mega(capacity), count: number) : t(mega_name)[capacity]
      end

      def mega(capacity)
        t(:mega)[capacity]
      end
    end
  end
end
