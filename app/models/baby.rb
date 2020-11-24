class Baby < ApplicationRecord
  has_many :breastfeedings, dependent: :destroy

  def to_s
    name
  end

  def feeding_count
    count_times(breastfeedings)
  end

  def total_time
    sum_time(breastfeedings)
  end

  def total_amount
    sum_amount(breastfeedings)
  end

  def total_amount_today
    sum_amount(breastfeedings.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day))
  end

  def total_time_today
    sum_time(breastfeedings.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day))
  end

  def feeding_count_today
    count_times(breastfeedings.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day))
  end

  def last_time
    breastfeedings.map(&:created_at).max
  end

  private

  def sum_time(feedings)
    feedings.map(&:time).inject { |sum, time| sum + time }.round(1)
  end

  def sum_amount(feedings)
    feedings.map(&:amount).inject { |sum, amount| sum + amount }.round(1)
  end

  def count_times(feedings)
    feedings.size
  end
end
