class Page < ApplicationRecord
  before_create :set_slug
  validates :name, presence: true, uniqueness: true, format: { with: /\A[а-яА-ЯёЁa-zA-Z0-9_]+\z/, message: 'Только цифры, буквы и _' }
  validates :title, :text, presence: true

  def to_param
    slug
  end

  private
  def set_slug
    self.slug = name.parameterize.truncate(80, omission: '')
  end
end
