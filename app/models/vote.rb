class Vote < ActiveRecord::Base
  validates :message, length: { minimum: 30 }
end
