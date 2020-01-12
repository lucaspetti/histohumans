# frozen_string_literal: true

module Api
  module V1
    class PeopleController < ::ApplicationController
      skip_before_action :authenticate_user!
      before_action :find_person, only: :show

      def index
        # @people = policy_scope(Person)
        @people = Person.all.map(&:as_json)
        render json: @people
      end

      def show; end

      private

      def find_person
        @person = Person.find_by!(name: params[:name])
        authorize @person
      end
    end
  end
end
