# frozen_string_literal: true

module Api
  module V1
    class PeopleController < ::ApplicationController
      before_action :find_person, only: :show

      def index
        @people = Person.where(person_params)
        render json: @people
      end

      def show
        if @person.present?
          render json: @person
        else
          render json: person_not_found
        end
      end

      private

      def find_person
        @person = sample? ? Person.all.sample : Person.find(person_params[:id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { status: 'error', message: e }
      end

      def sample?
        person_params[:id] == 'sample'
      end

      def person_params
        params.permit(:name, :id)
      end
    end
  end
end
