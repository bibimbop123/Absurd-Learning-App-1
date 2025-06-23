# == Schema Information
#
# Table name: absurd_stories
#
#  id                  :integer          not null, primary key
#  learning_concept_id :integer          not null
#  absurd_theme_id     :integer          not null
#  story_text          :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_absurd_stories_on_absurd_theme_id      (absurd_theme_id)
#  index_absurd_stories_on_learning_concept_id  (learning_concept_id)
#

class AbsurdStory < ApplicationRecord
  belongs_to :learning_concept
  belongs_to :absurd_theme

  validates :story_text, presence: true
  validates :learning_concept, presence: true
  validates :absurd_theme, presence: true
end
