require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = create(:company)
    category = create(:category)
    job = company.jobs.create!(title: "Developer", description: "So fun!", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Software Engineer"
    click_button "Update"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Software Engineer")
    expect(page).to_not have_content("Developer")
  end
end
