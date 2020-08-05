# frozen_string_literal: true

require 'wikipedia'

module Syncer
  class People
    def initialize(records)
      @records = records
    end

    def call
      @records.each { |record| find_page_and_update(record) }
      index_records
    end

    private

    def find_page_and_update(record)
      page = Wikipedia.find(record.name)
      attributes = get_attributes_from(page)
      update_record(record, attributes)
    end

    def get_attributes_from(page)
      {
        bio: page.summary,
        image_url: page.main_image_url,
        url: page.fullurl
      }
    end

    def update_record(record, attributes)
      record.update!(attributes)
    rescue ActiveRecord::RecordInvalid => e
      e.message
    end

    def index_records
      Search::Indexer.new.index_people
    end
  end
end
