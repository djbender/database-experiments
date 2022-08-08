class Cat < ApplicationRecord
  JSON_SCHEMA = Rails.root.join('config', 'json-schema.json')

  validates :config,
    presence: true,
    json: { schema: JSON_SCHEMA }
end
