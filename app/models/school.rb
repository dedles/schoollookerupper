class School < ActiveRecord::Base

	searchkick

	geocoded_by :address
	after_validation :geocode

	mount_uploader :image, ImageUploader
	has_many :reviews, dependent: :destroy
	validates :name, :address, :phone, :website, :image, presence: true

	validates :phone, format: { with: /\A\(?\d{3}\)?\s?\d{3}-?\s?\d{4}\z/,
	  message: "must be in the format: '(123) 456-7890'" }

	validates :website, format: { with: /\Ahttps?:\/\/.*\z/,
	  message: "must start with 'http://' or 'https://'" }

	validates :address, format: { with: /\A\d+[^,]+,[^,]+, [A-Z]\D*\z/,
	  message: "must be in the format: 'Number Street Name COMMA City COMMA Country (ex: 123 Fake St., Boston, USA) '" }

	private	

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
# a simpler regex for the phone number (current one may be buggy)
# \(?\d\)? ?-?