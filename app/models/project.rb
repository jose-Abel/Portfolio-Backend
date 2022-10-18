class Project < ApplicationRecord
	after_create_commit :actions_after_create
  before_destroy :purge_image

	has_many_attached :images

  validates_uniqueness_of :title

  validates :title, presence: true, length: { minimum: 3, maximum: 30 }

  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }

  validates :see_code, presence: true, length: { minimum: 10, maximum: 100 }

  validates :live_version, presence: true, length: { minimum: 10, maximum: 100 }

	private

  def actions_after_create
    update_columns(main_img: main_image_url)
    update_columns(secondary_img: secondary_image_url) if images.length > 1
  end

  def main_image_url
    url_for(images.first)
  end

  def secondary_image_url
    url_for(images.second)
  end

	def purge_image
    images.each { |image| image.purge }
  end
end
