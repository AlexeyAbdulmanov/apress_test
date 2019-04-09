class Page < ApplicationRecord
  before_create :set_slug
  before_save :refactor_text
  before_update :refactor_text
  validates :name, presence: true, uniqueness: true, format: { with: /\A[а-яА-ЯёЁa-zA-Z0-9_]+\z/, message: 'Только цифры, буквы и _' }
  validates :title, :text, presence: true

  has_ancestry

  def to_param
    slug
  end

  private
  def set_slug
    # self.slug = name.parameterize.truncate(80, omission: '')
    name_as_slug = name.parameterize.truncate(80, omission: '')
    if parent.present?
      self.slug = [parent.slug, (slug.blank? ? name_as_slug : slug)].join('/')
      # self.slug = [parent.slug, (slug.blank? ? name_as_slug : slug.split('/').last)].join('/')
    else
      self.slug = name_as_slug if slug.blank?
    end
  end

  def refactor_text
    self.text = text.gsub(/\*\*(?<string>.*)\*\*/, '<b>\k<string></b>')
    self.text = text.gsub(/\\\\(?<string>.*)\\\\/, '<i>\k<string></i>')
    self.text = text.gsub(/\(\((?<site>.*) (?<string>.*)\)\)/, '<a href="/\k<site>">\k<string></a>')
  end
end
