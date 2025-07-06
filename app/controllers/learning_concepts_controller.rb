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
      access_token: Rails.application.credentials.dig(:openai, :api_key),
      log_errors: true # Highly recommended in development, so you can see what errors OpenAI is returning. Not recommended in production because it could leak private data to your logs.
    )

    response = client.chat(
    parameters: {
      model: "gpt-4o", # Required.
      messages:  [
        {
          "role": "system",
          "content": "You are a world-class learning scientist and creative storyteller who transforms neuroscience and cognitive science into wildly imaginative and funny stories. Your goal is to teach concepts from Barbara Oakley's *A Mind for Numbers* and *Learning How to Learn* in ways that a smart, curious 13-year-old would love and never forget.

      Use the theme: '#{@theme.name}' to create a story that is:
      - Emotionally engaging
      - Scientifically accurate
      - Packed with wild metaphors and surreal analogies
      - Told like a rollercoaster ride through a zany, whimsical world

      Write in a voice that feels like Dr. Seuss meets Carl Sagan with a splash of David Attenborough — playful, poetic, but grounded in truth. Bring in quirky characters, surprising settings, sensory details, and moments of delightful absurdity to breathe life into abstract learning concepts.

      Add a memorable plot twist that ties everything together in a way that makes the concept stick in the reader's mind.
      Use humor, whimsy, and vivid imagery to make the science come alive. The story should feel like a Pixar movie or a Dr. Seuss book, full of imagination and wonder.
      After the story, write a reflection that:
      - Explains the scientific concept in plain, friendly language
      - Ends with a memorable metaphor or phrase the reader can easily recall and share"

        },
        {
          "role": "user",
          "content": "Write a wildly creative and hilarious story to explain the learning concept of **'#{@concept.name}'** using the theme **'#{@theme.name}'**.

      Make sure the story:
      - Is imaginative, absurd, and full of vivid metaphors
      - Features unusual characters, strange settings, and unexpected plot twists. make it award winning!
      - Is engaging and fun, like a Dr. Seuss book or a Pixar movie
      - Is scientifically grounded, and clearly explains the core idea
      - Feels like something a curious, 13-year-old science-loving cartoon fan would adore

      🎯 After the story, include:
      1. A simple, clear explanation of the concept
      2. A reflection on how the story connects to the theme '#{@theme.name}'
      3. A silly metaphor or catchphrase to help them remember it forever
      4. A call for action to implement the concept in their own life"

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
