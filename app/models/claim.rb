class Claim < ActiveRecord::Base

  enum(status: {
    center_error: -1,
    fresh: 0,
    claiming: 1,
    completed: 2,
  })

  has_many :integration_data, as: :owner

  scope :created_at_or_after, ->(time) do
    where(arel_table[:created_at].gteq(time))
  end

  scope :created_at_or_before, ->(time) do
    where(arel_table[:created_at].lteq(time))
  end

  scope :created_on, ->(date) do
    created_at_or_after(date.beginning_of_day).
      created_at_or_before(date.end_of_day)
  end

end
