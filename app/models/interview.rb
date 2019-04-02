class Interview < ApplicationRecord
  belongs_to :user
  enum status: {approve:1, reject:2, hold:3}
end