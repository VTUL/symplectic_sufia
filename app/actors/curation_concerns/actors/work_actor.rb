# Generated via
#  `rails generate curation_concerns:work Work`
module CurationConcerns
  module Actors
    class WorkActor < CurationConcerns::Actors::BaseActor

      protected

        def apply_save_data_to_curation_concern(attributes)
          attributes[:rights] = Array(attributes[:rights]) if attributes.key? :rights
          remove_blank_attributes!(attributes)
          attributes.delete(:remote_files) unless curation_concern.attributes[:remote_files]
          attributes.delete(:uploaded_files) unless curation_concern.attributes[:uploaded_files]
          curation_concern.attributes = attributes
          curation_concern.date_modified = CurationConcerns::TimeService.time_in_utc
        end

    end
  end
end
