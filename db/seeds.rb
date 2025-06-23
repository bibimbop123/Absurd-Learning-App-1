# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
learning_concepts = [
  {
    name: "Focused Mode vs Diffuse Mode",
    description: "Focused mode is intense concentration on a concept. Diffuse mode is relaxed, open thinking that forms connections. Alternating enhances creativity."
  },
  {
    name: "Chunking",
    description: "Breaking complex ideas into manageable chunks. Helps build mental frameworks for faster understanding."
  },
  {
    name: "Procrastination & the Pomodoro Technique",
    description: "Procrastination blocks learning. The Pomodoro technique (25 min focus + 5 min break) helps overcome it."
  },
  {
    name: "Practice and Repetition",
    description: "Deliberate practice solidifies learning. Active recall is better than passive review."
  },
  {
    name: "Interleaving",
    description: "Mixing problem types improves adaptability and memory. Avoid practicing one topic in isolation."
  },
  {
    name: "Memory Techniques & Spaced Repetition",
    description: "Spaced repetition strengthens long-term memory. Memory palaces and mnemonics boost efficiency."
  },
  {
    name: "Overcoming Fear and Math Anxiety",
    description: "Mindset shifts and embracing mistakes help reduce fear. Confidence is built by trying."
  },
  {
    name: "Metacognition",
    description: "Thinking about your own thinking. Monitor learning strategies, adapt, and reflect to improve."
  },
  {
    name: "Analogies and Visualization",
    description: "Using metaphors and mental imagery makes abstract concepts easier to understand."
  },
  {
    name: "Active Learning Strategies",
    description: "Learn by teaching, explaining, or doing. Passive reading ≠ real learning."
  },
  {
    name: "Growth Mindset",
    description: "Believing abilities grow with effort. Opposite of fixed mindset. Key to perseverance."
  },
  {
    name: "Mental Models",
    description: "Mental models are frameworks to understand the world. The more you have, the better your reasoning."
  },
  {
    name: "Dealing with Frustration and Stuck Points",
    description: "Getting stuck is part of learning. Push through confusion using breaks, mindset shifts, and persistence."
  },
  {
    name: "Sleep and Rest for Learning",
    description: "Sleep strengthens memory and helps solve problems. Don’t cram — nap instead!"
  }
]

learning_concepts.each do |concept|
  LearningConcept.create!(concept)
end

# 10 Absurd Themes
absurd_themes = [
  { name: "Brian Kim, the Rhino Astronaut", description: "Brian Kim, the Rhino Astronaut and his adventures with Space budz companions" },
  { name: "Squirrels Running a University", description: "Nuts about knowledge and grading on acorn curves." },
  { name: "Space Pirates", description: "Looting black holes for math wisdom." },
  { name: "Underwater Kingdom", description: "Octopus professors teaching in bubble classrooms." },
  { name: "Alien Kindergarten", description: "Galactic toddlers learning quantum arithmetic." },
  { name: "Haunted Library", description: "Ghosts whisper equations and spooky analogies in the dark." },
  { name: "Talking Vegetables", description: "Carrots teaching calculus and spinach explaining statistics." },
  { name: "Time-Traveling Knights", description: "Armor-clad warriors debating philosophy with robots." },
  { name: "Cats in Government", description: "Meow-nisters passing laws on logic and lattice theory." },
  { name: "Insect Rock Bands", description: "Beetles belting out brainwaves in neuroscience concerts." },
  { name: "Dessert Island", description: "Cakes and cookies debating over chemistry and chaos theory." }
]

absurd_themes.each do |theme|
  AbsurdTheme.create!(theme)
end

puts "Seeded #{LearningConcept.count} learning concepts and #{AbsurdTheme.count} absurd themes."
