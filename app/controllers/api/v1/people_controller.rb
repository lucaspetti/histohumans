# frozen_string_literal: true

module Api
  module V1
    class PeopleController < ::ApplicationController
      skip_before_action :authenticate_user!
      before_action :find_person, only: :show

      def index
        @people = Person.where(person_params)
        render json: @people
      end

      def show
        @person = find_person
        render json: @person if @person.present?
      end

      private

      def find_person
        @person = person_params[:sample] ? Person.sample : Person.find(person_params[:id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { status: 'error', message: e }
      end

      def person_params
        params.permit(:first_name, :last_name, :id, :sample)
      end
    end
  end
end
