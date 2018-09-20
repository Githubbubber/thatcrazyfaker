class Post < ApplicationRecord
	
  validates :title,
      presence: true,
      length: { minimum: 7, maximum: 10 },
      format: { with: /[A-Za-z0-9._]/ }

  validates :author,
      presence: true,
      length: { minimum: 4, maximum: 20 },
      format: { with: /[A-Za-z0-9._]/ }

  validates :content,
      presence: true,
      length: { minimum: 8, maximum: 50 },
      format: { with: /[\s\w.!\-,:;\']/ }
end
