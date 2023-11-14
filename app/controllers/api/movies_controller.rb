class Api::MoviesController < ApplicationController
    def get_associations_recursive(associations, prefix = nil)
      associations_keys = []

      associations.each do |association|
        association_name = "#{prefix}.#{association}" if prefix.present?
        associations_keys << association_name if association_name.present?
        associations_keys << association.to_s if prefix.blank?

        serializer_class = association.to_s.classify.constantize
        associations_names = serializer_class.reflect_on_all_associations(:has_many).map(&:name)

        if associations_names.present?
          associations_keys += get_associations_recursive(associations_names, association)
        end
      end

      associations_keys
    end

    def get_allowed_includes
      base_associations = MovieSerializer.relationships_to_serialize.keys
      get_associations_recursive(base_associations)
    end

  def index
    @movies = Movie.all.includes(:actors, :photos)

    serialized = MovieSerializer.new(@movies, {
      include: self.get_allowed_includes # it will return [actors, actors.photos]
    }).serializable_hash.to_json

    render json: serialized
  end
end


class BaseSerializer
  include JSONAPI::Serializer
end

class MovieSerializer < BaseSerializer
  attributes :title, :year, :description

  has_many :actors
end

class ActorSerializer < BaseSerializer

  attributes :name

  has_many :photos
  belongs_to :movie
end

class PhotoSerializer < BaseSerializer
  attributes :image_url

  belongs_to :actor
end