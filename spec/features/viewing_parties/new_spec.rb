require 'rails_helper'

describe 'As a authenticated user' do
  describe 'When I visit the new viewing party page', :vcr do
    before :each do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      @user_list = create_list(:user, 3)

      @user.friendships.create!(friend_id: @user_list.first.id)
      @user.friendships.create!(friend_id: @user_list.second.id)
      @user.friendships.create!(friend_id: @user_list.third.id)

    end

    it 'should see Movie Title, Duration, Date, Start time,
    checkboxes to each friend, and create party button' do
      visit '/discover'
      click_button("Top 40 Movies")
      expect(current_path).to eq('/movies')

      click_link("The Shawshank Redemption")

      click_button 'Create Viewing Party for Movie'

      expect(current_path).to eq('/viewing_party/new')

      expect(page).to have_content('Viewing Party Details')
      expect(page).to have_content("Movie title: The Shawshank Redemption")
      expect(page).to have_content("Duration of Party")
      expect(page).to have_field(:duration, placeholder: 142)

      fill_in :date, with: '12/12/2020'

      expect(page).to have_content('Start Time')
      fill_in :start_time,	with: '10:15'

      expect(page).to have_content('Include')


      check("#{@user_list.first.name}")
      check("#{@user_list.second.name}")

      click_button 'Create Party'

      expect(current_path).to eq('/dashboard')

      within ".viewing_parties" do
        expect(page).to have_content('The Shawshank Redemption')
        expect(page).to have_content('12/12/2020')
        expect(page).to have_content('10:15')
        expect(page).to have_content('Hosting')
      end
    end

    it 'I should see parties I am invited to' do
      visit '/discover'

      click_button("Top 40 Movies")
      expect(current_path).to eq('/movies')

      click_link("The Shawshank Redemption")

      click_button 'Create Viewing Party for Movie'

      expect(current_path).to eq('/viewing_party/new')

      expect(page).to have_content('Viewing Party Details')
      expect(page).to have_content("Movie title: The Shawshank Redemption")
      expect(page).to have_content("Duration of Party")
      expect(page).to have_field(:duration, placeholder: 142)

      fill_in :date, with: '12/12/2020'

      expect(page).to have_content('Start Time')
      fill_in :start_time,	with: '10:15'

      expect(page).to have_content('Include')

      check("#{@user_list.first.name}")
      check("#{@user_list.second.name}")

      click_button 'Create Party'

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_list.first)

      visit '/dashboard'

      within ".viewing_parties" do
        expect(page).to have_content('The Shawshank Redemption')
        expect(page).to have_content('12/12/2020')
        expect(page).to have_content('10:15')
        expect(page).to have_content('Invited')
      end
    end

    it 'I cannot set a duration less than the time of the movie or longer than 999 minutes' do
      visit '/discover'

      click_button("Top 40 Movies")
      expect(current_path).to eq('/movies')

      click_link("The Shawshank Redemption")

      click_button 'Create Viewing Party for Movie'

      expect(current_path).to eq('/viewing_party/new')

      fill_in :date, with: '12/12/2020'
      fill_in :duration, with: 100
      fill_in :start_time,	with: '10:15'

      click_button 'Create Party'
      
    end
  end
end
