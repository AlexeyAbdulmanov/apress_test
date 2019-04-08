require 'rails_helper'

RSpec.describe 'edit page', type: :feature do
  #let(:page) { FactoryBot.create :page }
  #let!(:page) { Page.create(name: 'name1', title: 'title1', text: '123') }

  it 'edit page' do
    p = Page.create(name: 'name1', title: 'title1', text: '123')
    visit(edit_page_path(p))
    
    fill_in('page[title]', with: 'New title')
    fill_in('page[text]', with: 'New text.')
    click_button 'Сохранить Page'

    expect(page).to have_content('Page was successfully updated.')
    expect(page).to have_content('New title')
    expect(page).to have_content('New text.')
  end

  it 'not edit page' do
    p = Page.create(name: 'name1', title: 'title1', text: '123')
    visit(edit_page_path(p))
    
    fill_in('page[title]', with: '')
    fill_in('page[text]', with: '')
    click_button 'Сохранить Page'

    expect(page).to_not have_content('Page was successfully updated.')
    expect(page).to have_content('Title не может быть пустым')
    expect(page).to have_content('Text не может быть пустым')
  end
end
