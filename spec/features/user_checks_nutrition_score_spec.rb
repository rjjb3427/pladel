require 'rails_helper'

feature 'Check nutrition score' do
  context 'with great nutrition' do
    scenario 'and sees A' do
      user = create(:user)
      create(:meal, status: 'complete', user: user)
      visit dashboard_index_path(as: user)

      within('.nutrition') do
        expect(page).to have_content 'A'
      end
    end
  end

  context 'with poor nutrition' do
    scenario 'and sees F' do
      user = create(:user)
      create(:meal, status: 'incomplete', user: user)
      visit dashboard_index_path(as: user)

      within('.nutrition') do
        expect(page).to have_content 'F'
      end
    end
  end
end
