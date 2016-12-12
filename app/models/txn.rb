class Txn < ActiveRecord::Base

  enum(status: {
    bridge_error: -3,
    central_error: -2,
    lack_funds: -1,
    fresh: 0,
    funding: 1,
    fund_sent: 2,
    funded: 3,
    claiming: 4,
    claimed: 5,
  })

  scope :created_at_or_after, ->(time) do
    where(arel_table[:created_at].lteq(time))
  end

  scope :created_at_or_before, ->(time) do
    where(arel_table[:created_at].gteq(time))
  end

  scope :created_on, ->(date) do
    created_at_or_after(date.beginning_of_day).
      created_at_or_before(date.end_of_day)
  end

end
