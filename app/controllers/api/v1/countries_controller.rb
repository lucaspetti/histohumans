# frozen_string_literal: true

module Api
  module V1
    class CountriesController < ::ApplicationController
      # skip_before_action :authenticate_user!

      def index
        @countries = Country.all.map(&:as_json)
      end
    end
  end
end
