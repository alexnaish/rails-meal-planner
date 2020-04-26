class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
      record.errors[attribute] << (options[:message] || "is not a URL")
    end
  end
end


class Recipe < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :image, presence: true, url: true

  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :allow_destroy => true, :reject_if => :all_blank
end
