class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: :true
  has_many :comments

  def self.jobs_by_interest
    group(:level_of_interest).order('level_of_interest DESC').count(:id)
  end

  def self.avg_interest_by_company
    companies = self.group(:company_id).average(:level_of_interest).sort_by{|k, v| v}.reverse
    companies[0..2]
  end

  def self.location_count
    group(:city).order('count(id) DESC').count
  end
end
