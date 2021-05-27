class Note < ApplicationRecord
  belongs_to :admin_user

  validates :name, :time, presence: true
  validate :time_check

  private

  def time_check
    return if time.blank? 

    if time < Time.now
      errors.add(:time, "reminder cannot be in the past tense")
    end
 end
end
