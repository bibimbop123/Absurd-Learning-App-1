# == Schema Information
#
# Table name: absurd_themes
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AbsurdTheme < ApplicationRecord
  has_many :absurd_stories, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  def to_s
    name
  end
end
