class SurveyImage < ActiveRecord::Base
    belongs_to :imageable, :polymorphic => true

    has_attached_file :photo, PAPERCLIP_STORAGE_OPTS ##  this constant is in /config/environments/*.rb

  #image_tag @product.photo.url(:small)
    validates_attachment_presence :photo
    validates_attachment_size     :photo, :less_than => 5.megabytes
    validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

    validates :imageable_type,  :presence => true
    #validates :imageable_id,    :presence => true
    validate :validate_photo

    default_scope :order => 'position'

    # save the w,h of the original image (from which others can be calculated)
    MAIN_LOGO = 'logo'

    # if there are errors from the plugin, then add a more meaningful message
    def validate_photo
      unless photo.errors.empty?
        # uncomment this to get rid of the less-than-useful interrim messages
        # errors.clear
        errors.add :attachment, "Paperclip returned errors for file '#{photo_file_name}' - check ImageMagick installation or image source file."
        false
      end
    end
end
