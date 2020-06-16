class Notebook < ApplicationRecord
  belongs_to :user
  has_many :pages, dependent: :destroy

  def get_next_page_position
    if pages.none? { |page| page.persisted? }
      1
    else
      pages.order(position: :asc).last.position + 1
    end
  end
end
