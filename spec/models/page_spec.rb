require 'rails_helper'

RSpec.describe Page, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:text) }

  it { is_expected.to allow_value('foo_bar').for(:name) }
  it { is_expected.to allow_value('FOO_BAR').for(:name) }
  it { is_expected.to_not allow_value('foo bar').for(:name) }
  it { is_expected.to allow_value('ФУ_БАР').for(:name) }
  it { is_expected.to allow_value('фу_бар').for(:name) }
  it { is_expected.to allow_value('12345').for(:name) }

  context 'validations check' do
    describe '#content_presence' do
      let(:page) { Page.new }

      it 'should fail if all content blank' do
        page.valid?
        
        expect(page.errors.full_messages).to include('Name не может быть пустым')
        expect(page.errors.full_messages).to include('Name Только цифры, буквы и _')
        expect(page.errors.full_messages).to include('Title не может быть пустым')
        expect(page.errors.full_messages).to include('Text не может быть пустым')
      end

      it 'should pass if name present' do
        page.name = 'foo'
        page.valid?

        expect(page.errors.full_messages).to_not include('Name не может быть пустым')
        expect(page.errors.full_messages).to_not include('Name Только цифры, буквы и _')
      end

      it 'should pass if title present' do
        page.title = 'foo'
        page.valid?

        expect(page.errors.full_messages).to_not include('Title не может быть пустым')
      end

      it 'should pass if title present' do
        page.text = 'foo'
        page.valid?

        expect(page.errors.full_messages).to_not include('Text не может быть пустым')
      end
    end
  end
end
