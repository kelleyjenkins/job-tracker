require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = create(:company)
    category = create(:category)
    job = create(:job, company: company, category: category)

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Software Engineer"
    click_button "Update"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Software Engineer")
    expect(page).to_not have_content("Developer")
  end
end
