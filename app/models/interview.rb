class Interview < ApplicationRecord
  belongs_to :user
  enum status: {"承認":1, "拒否":2, "保留":3}
  validate  :interview_date_cannot_be_in_the_past
  validate :approved_interview_cannnot_be_changed_expect_status if :status_was == :approve
  
  def interview_date_cannot_be_in_the_past
    if scheduled_at.present? and scheduled_at < Time.now
      errors.add(:scheduled_at,"は過去の日付を面接に設定はできません")
    end
  end
  
  def approved_interview_cannnot_be_changed_scheduled_at
    if will_save_change_to_scheduled_at? 
      errors.add(:base,"承認済みの面接の時間は変更はできません")
    end
  end
end
