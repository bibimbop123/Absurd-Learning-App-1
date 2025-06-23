require "dotenv/load"

class LearningConceptsController < ApplicationController
  def index
    @concepts = LearningConcept.all
    @themes = AbsurdTheme.all
  
    @absurd_stories = AbsurdStory.all.order(created_at: :desc).limit(5)
  
    if params[:learning_concept_id].present? && params[:absurd_theme_id].present?
      @concept = LearningConcept.find(params[:concept_id])
      @theme = AbsurdTheme.find(params[:theme_id])
      @absurd_story = AbsurdStory.find_by(learning_concept: @concept, absurd_theme: @theme)
    else
      @concept = nil
      @theme = nil
      @absurd_story = nil
    end
  end

  def generate_story
    @concept = LearningConcept.find(params[:concept_id])
    @theme = AbsurdTheme.find(params[:theme_id])

    client =  OpenAI::Client.new(
      access_token: ENV.fetch("OPENAI_API_KEY"),
      log_errors: true # Highly recommended in development, so you can see what errors OpenAI is returning. Not recommended in production because it could leak private data to your logs.
    )
   

    response = client.chat(
    parameters: {
      model: "gpt-4o", # Required.
      messages:  [
        {
          "role": "system",
          "content": "You are a world-class learning expert and creative storyteller. You explain deep learning concepts from Barbara Oakley's 'A Mind for Numbers' and 'Learning How to Learn' using wildly imaginative, absurd stories. Your stories are scientifically accurate, emotionally engaging, and designed to make the ideas unforgettable. You speak with flair, using humor, weird metaphors, and vivid analogies to turn serious ideas into creative tales that a curious 13-year-old could understand and love."
        },
        {
          "role": "user",
          "content": "Generate a creative, absurd, and hilarious story to explain the learning concept '#{@concept.name}' using the theme '#{@theme.name}'. The story should be imaginative, full of metaphors, and use absurdity to help the reader deeply understand the concept while being entertained. End the story with a short reflection summarizing the key idea in plain language."
        }
    ]
    }
  )

    @absurd_story = AbsurdStory.create!(
      learning_concept: @concept,
      absurd_theme: @theme,
      story_text: response.dig("choices", 0, "message", "content")
    )

    redirect_to learning_concept_path(@concept), notice: "Your absurd story was generated!"
  end

  def show
    @concept = LearningConcept.find(params[:id])
    @theme = @concept.absurd_themes.first # Get the first theme associated with this concept
    @absurd_stories = @concept.absurd_stories.order(created_at: :desc)
  end
end
