require "rails_helper"

feature "Signing out" do
  scenario "user signs out" do
    create :user, email: "joebloggs@email.com", password: "password"

    sign_in_with email: "joebloggs@email.com", password: "password"
    click_link "Sign out"
    expect(page).to have_text "Signed out successfully."
  end
end
