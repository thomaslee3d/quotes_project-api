class Quote < ApplicationRecord
  belongs_to :user
  validates :quote, :given_name, :user, presence: true
end
