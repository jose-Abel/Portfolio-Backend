class Project < ApplicationRecord
	after_create_commit :actions_after_create
  before_destroy :purge_image

	has_many_attached :images

	private

  def actions_after_create
    update_columns(main_img: image_url)
  end

  def image_url
    url_for(images.first)
  end

	def purge_image
    images.each { |image| image.purge }
  end
end
