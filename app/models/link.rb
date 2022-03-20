class Link < ApplicationRecord

  def self.search_on_title_and_page(element)
    search_string = "%#{element}%".downcase
    where("lower(title) LIKE ? OR lower(page) LIKE ?", search_string, search_string).order(:title)
  end
end
