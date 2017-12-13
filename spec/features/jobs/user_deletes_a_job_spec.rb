
require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = create(:company)
    category = create(:category)
    job = create(:job, company: company, category: category)

    visit company_jobs_path(company)
    click_link "Delete"

    expect(page).to have_content("#{job.title} was successfully deleted!")
  end
end
