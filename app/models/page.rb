class Page < ApplicationRecord
  validates :name, presence: true, format: { with: /\A[а-яА-ЯёЁa-zA-Z0-9_]+\z/, message: 'Только цифры, буквы и _' }
  validates :title, :text, presence: true
end
