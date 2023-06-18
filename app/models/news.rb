class News < ApplicationRecord
  belongs_to :user, optional: false, foreign_key: 'users_id'
  has_one_attached :image

  validates :main_text, presence: true
  validates :short_text, presence: true

  def as_json(options = {})
    attr = super
    attr[:image_url] = Rails.application.routes.url_helpers.rails_blob_path(image,only_path: true)
    attr[:creator_id] = user.id
    attr[:creator_name] = user.name
    if options[:list]
      attr.except(:user, :image, :main_text)
    else
      attr.except(:user, :image)
    end
  end
end
