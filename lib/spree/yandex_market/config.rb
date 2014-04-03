module Spree
  module YandexMarket
    # Singleton class to access the advanced cart configuration object (YandexMarketConfiguration.first by default) and it's preferences.
    #
    # Usage:
    #   Spree::YandexMarket::Config[:foo]                  # Returns the foo preference
    #   Spree::YandexMarket::Config[]                      # Returns a Hash with all the google base preferences
    #   Spree::YandexMarket::Config.instance               # Returns the configuration object (YandexMarketConfiguration.first)
    #   Spree::YandexMarket::Config.set(preferences_hash)  # Set the advanced cart preferences as especified in +preference_hash+
    class Config
      include Singleton

      class << self
        def instance
          return nil unless ActiveRecord::Base.connection.tables.include?('spree_configurations')
          Spree::YandexMarketConfiguration.first_or_create
        end
      end
    end
  end
end

