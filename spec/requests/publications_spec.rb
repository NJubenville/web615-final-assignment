require 'rails_helper'


RSpec.describe "Publications", type: :request do
  before(:each) do
    @user = FactoryBot.create(:admin) # Create the user

    visit root_path
    expect(current_path).to eq(new_user_session_path)
    expect(current_path).to_not eq(root_path)

    within('#new_user') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    expect(current_path).to eq(root_path)
    expect(current_path).to_not eq(new_user_session_path)
    expect(page).to have_content('Signed in successfully.')
  end

  describe 'GET #index' do
    describe 'valid: ' do
      it 'should return a list of publications' do
        @publication = FactoryBot.create(:publication)
        click_link 'Publications'
        expect(current_path).to eq(publications_path)

        expect(page).to have_content(@publication.title)
        # save_and_open_page
      end
    end
    describe 'invalid: ' do
      # Since there's no real invalid version of this test we skip it
    end
  end

  describe 'GET #show' do
    describe 'valid: ' do
      it 'should return a publication' do
        @publication = FactoryBot.create(:publication)
        click_link 'Publications'
        expect(current_path).to eq(publications_path)

        expect(page).to have_content(@publication.title)

        click_link 'Show'
        expect(current_path).to eq(publication_path(@publication))

        expect(page).to have_content(@publication.title)
        # save_and_open_page
      end
    end

    describe 'invalid: ' do
      it 'should not return a publication if one does not exist' do
        visit publication_path(99_999)
        expect(current_path).to eq(publications_path)
        expect(page).to have_content("The publication you're looking for cannot be found")
        # save_and_open_page
      end
    end
  end
  describe 'GET #new' do
    describe 'valid: ' do
      it 'should create a new publication with valid attributes' do
        click_link 'Publications'
        expect(current_path).to eq(publications_path)

        click_link 'New Publication'
        expect(current_path).to eq(new_publication_path)

        fill_in 'publication_title', with: 'New_Publication'
        click_button 'Create Publication'
        # save_and_open_page
        expect(page).to have_content('Publication was successfully created.')
        expect(page).to have_content('New_Publication')
      end
    end


    describe 'invalid: ' do
      it 'should not create a new publication with invalid attributes' do
        click_link 'Publications'
        expect(current_path).to eq(publications_path)

        click_link 'New Publication'
        expect(current_path).to eq(new_publication_path)

        fill_in 'publication_title', with: ''
        click_button 'Create Publication'
        # save_and_open_page
        expect(page).to have_content("Title can't be blank")
      end
    end
  end

  describe 'GET #edit' do
    describe 'valid: ' do
      it 'should update a publication with valid attributes' do
        @publication = FactoryBot.create(:publication)
        click_link 'Publications'
        expect(current_path).to eq(publications_path)

        expect(page).to have_content(@publication.title)

        click_link 'Show'
        expect(current_path).to eq(publication_path(@publication))

        expect(page).to have_content(@publication.title)

        @new_user = FactoryBot.create(:user)

        click_link 'Edit'
        expect(current_path).to eq(edit_publication_path(@publication))

        fill_in 'publication_title', with: 'Edited_Publication_Title'
        click_button 'Update Publication'

        expect(page).to have_content('Publication was successfully updated.')
        expect(page).to have_content('Edited_Publication_Title')
        expect(current_path).to eq(publication_path(@publication))
        # save_and_open_page
      end
    end
    describe 'invalid: ' do
      it 'should not update a publication with invalid attributes' do
        @publication = FactoryBot.create(:publication)
        click_link 'Publications'
        expect(current_path).to eq(publications_path)

        expect(page).to have_content(@publication.title)

        click_link 'Show'
        expect(current_path).to eq(publication_path(@publication))

        expect(page).to have_content(@publication.title)

        click_link 'Edit'
        expect(current_path).to eq(edit_publication_path(@publication))

        fill_in 'publication_title', with: ''
        click_button 'Update Publication'

        expect(page).to have_content("Title can't be blank")
        # save_and_open_page
      end
    end
  end

  describe 'DELETE #destroy' do
    describe 'valid: ' do
      it 'should destroy a publication when destroy is clicked' do
        @publication = FactoryBot.create(:publication)
        click_link 'Publications'
        expect(current_path).to eq(publications_path)

        expect(page).to have_content(@publication.title)
        click_link 'Destroy'

        save_page
        expect(current_path).to eq(publications_path)
        expect(page).to have_content('Publication was successfully destroyed.')
      end
    end
  end
end
