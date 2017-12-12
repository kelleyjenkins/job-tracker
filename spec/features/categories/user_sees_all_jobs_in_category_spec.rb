require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees all jobs in category" do
    category = Category.create!(title: "Web Design")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", description: "So fun!", level_of_interest: 70, city: "Denver", category_id: category.id)
    job2 = company.jobs.create!(title: "Designer", description: "Pretty!", level_of_interest: 65, city: "Chicago", category_id: category.id)


    visit category_path(category)

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Developer")
    expect(page).to have_content("So fun!")
    expect(page).to have_content("Designer")
  end
end
