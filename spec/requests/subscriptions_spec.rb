require 'rails_helper'


RSpec.describe "Subscription", type: :request do
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
      it 'should return a list of subscription' do
        @subscription = FactoryBot.create(:subscription)
        click_link 'Subscriptions'
        expect(current_path).to eq(subscriptions_path)

        expect(page).to have_content(@subscription.title)
        # save_and_open_page
      end
    end
    describe 'invalid: ' do
      # Since there's no real invalid version of this test we skip it
    end
  end

  describe 'GET #show' do
    describe 'valid: ' do
      it 'should return a subscription' do
        @subscription = FactoryBot.create(:subscription)
        click_link 'Subscriptions'
        expect(current_path).to eq(subscriptions_path)

        expect(page).to have_content(@subscription.title)

        click_link 'Show'
        expect(current_path).to eq(subscription_path(@subscription))

        expect(page).to have_content(@subscription.title)
        # save_and_open_page
      end
    end

    describe 'invalid: ' do
      it 'should not return a subscription if one does not exist' do
        visit subscription_path(99_999)
        expect(current_path).to eq(subscriptions_path)
        expect(page).to have_content("The subscription you're looking for cannot be found")
        # save_and_open_page
      end
    end
  end
  describe 'GET #new' do
    describe 'valid: ' do
      it 'should create a new subscription with valid attributes' do
        click_link 'Subscriptions'
        expect(current_path).to eq(subscriptions_path)

        click_link 'New Subscription'
        expect(current_path).to eq(new_subscription_path)

        fill_in 'subscription_title', with: 'New_Subscription'
        click_button 'Create Subscription'
        # save_and_open_page
        expect(page).to have_content('Subscription was successfully created.')
        expect(page).to have_content('New_Subscription')
      end
    end


    describe 'invalid: ' do
      it 'should not create a new subscription with invalid attributes' do
        click_link 'Subscriptions'
        expect(current_path).to eq(subscriptions_path)

        click_link 'New Subscription'
        expect(current_path).to eq(new_subscription_path)

        fill_in 'subscription_title', with: ''
        click_button 'Create Subscription'
        # save_and_open_page
        expect(page).to have_content("Title can't be blank")
      end
    end
  end

  describe 'GET #edit' do
    describe 'valid: ' do
      it 'should update a subscription with valid attributes' do
        @subscription = FactoryBot.create(:subscription)
        click_link 'Subscriptions'
        expect(current_path).to eq(subscriptions_path)

        expect(page).to have_content(@subscription.title)

        click_link 'Show'
        expect(current_path).to eq(subscription_path(@subscription))

        expect(page).to have_content(@subscription.title)

        @new_user = FactoryBot.create(:user)

        click_link 'Edit'
        expect(current_path).to eq(edit_subscription_path(@subscription))

        fill_in 'subscription_title', with: 'Edited_Subscription_Title'
        click_button 'Update Subscription'

        expect(page).to have_content('Subscription was successfully updated.')
        expect(page).to have_content('Edited_Subscription_Title')
        expect(current_path).to eq(subscription_path(@subscription))
        # save_and_open_page
      end
    end
    describe 'invalid: ' do
      it 'should not update a subscription with invalid attributes' do
        @subscription = FactoryBot.create(:subscription)
        click_link 'Publications'
        expect(current_path).to eq(subscriptions_path)

        expect(page).to have_content(@subscription.title)

        click_link 'Show'
        expect(current_path).to eq(subscription_path(@subscription))

        expect(page).to have_content(@subscription.title)

        click_link 'Edit'
        expect(current_path).to eq(edit_subscription_path(@subscription))

        fill_in 'subscription_title', with: ''
        click_button 'Update Subscription'

        expect(page).to have_content("Title can't be blank")
        # save_and_open_page
      end
    end
  end

  describe 'DELETE #destroy' do
    describe 'valid: ' do
      it 'should destroy a subscription when destroy is clicked' do
        @subscription = FactoryBot.create(:subscription)
        click_link 'Publications'
        expect(current_path).to eq(subscriptions_path)

        expect(page).to have_content(@subscription.title)
        click_link 'Destroy'

        save_page
        expect(current_path).to eq(subscriptions_path)
        expect(page).to have_content('Subscription was successfully destroyed.')
      end
    end
  end
end
