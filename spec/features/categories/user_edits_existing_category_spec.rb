require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = create(:category)

    visit edit_category_path(category)

    fill_in "category[title]", with: "NewCat"
    click_button "Update"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("NewCat")
    expect(page).to_not have_content("Computers")
  end
end
