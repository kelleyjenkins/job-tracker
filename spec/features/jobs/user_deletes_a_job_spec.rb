
require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = create(:company)
    category = create(:category)
    job = company.jobs.create!(title: "Developer", description: "So fun!", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit company_jobs_path(company)
    click_link "Delete"

    expect(page).to have_content("Developer was successfully deleted!")
  end
end
