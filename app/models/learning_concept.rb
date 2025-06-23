# == Schema Information
#
# Table name: learning_concepts
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LearningConcept < ApplicationRecord
  has_many :absurd_stories, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  has_many :absurd_themes, through: :absurd_stories
end
