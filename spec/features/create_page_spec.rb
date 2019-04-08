require 'rails_helper'

RSpec.describe 'create page', type: :feature do

  it 'create root page' do
    visit(root_path)
    
    click_link("Add root page")
    
    fill_in('page[name]', with: 'Page')
    fill_in('page[title]', with: 'Page title')
    fill_in('page[text]', with: 'Интересный текст.')
    click_button 'Создать Page'

    expect(page).to have_content('Page was successfully created.')
    expect(page).to have_content('Page title')
    expect(page).to have_content('Интересный текст.')
    expect(Page.last.parent_id).to eq(nil)
    expect(Page.count).to eq(1)
  end

  it 'not create root page' do
    visit(root_path)

    click_link("Add root page")
    click_button 'Создать Page'

    expect(page).to_not have_content('Page was successfully created.')
    expect(page).to have_content('Name не может быть пустым')
    expect(page).to have_content('Name Только цифры, буквы и _')
    expect(page).to have_content('Title не может быть пустым')
    expect(page).to have_content('Text не может быть пустым')
  end

  it 'create subpage' do
    p = Page.create(name: 'name1', title: 'title1', text: '123')
    visit(root_path)
    
    click_link("name1")
    
    expect(page).to have_content('Страница: name1')
    expect(page).to have_content('title1')
    expect(page).to have_content('123')
    expect(Page.last.parent_id).to eq(nil)
    expect(Page.count).to eq(1)

    click_link("Add subpage")
    
    fill_in('page[name]', with: 'Subpage')
    fill_in('page[title]', with: 'subpage title')
    fill_in('page[text]', with: 'subpage text')

    click_button 'Создать Page'
    
    expect(page).to have_content('Page was successfully created.')
    expect(page).to have_content('Subpage')
    expect(page).to have_content('subpage title')
    expect(page).to have_content('subpage text')
    expect(page).to have_content('subpage text')
    expect(Page.last.parent_id).to eq(1)
    expect(Page.count).to eq(2)
  end
end
