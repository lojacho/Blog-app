class User < ApplicationRecord
    has_many :comments
    has_many :likes
    validates :photo, format: { with: /\Ahttps?:\/\/\S+\.(png|jpe?g|gif)\z/i, message: "must be a valid image URL" }

end
