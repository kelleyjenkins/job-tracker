require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    category = create(:category)

    visit category_path(category)

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content(category.title)
  end
end
