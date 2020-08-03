# frozen_string_literal: true

module Api
  module V1
    class SearchesController < ::ApplicationController
      skip_before_action :authenticate_user!

      def index
        if search_params.present?
          response = search_service.search_for(search_params)
          parsed_response = JSON.parse(response.body)
          render json: parsed_response
        else
          render json: []
        end
      end

      private

      def search_params
        params.permit(:q)
      end

      def search_service
        Search::Searcher.new
      end
    end
  end
end
