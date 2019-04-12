class Interview < ApplicationRecord
  belongs_to :user
  enum status: {"承認":1, "拒否":2, "保留":3}
end