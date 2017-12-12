require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    category = Category.create!(title: "Web Design")

    visit category_path(category)

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Web Design")
  end
end
