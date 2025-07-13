# db/seeds.rb

# This file seeds the database with default values.
# It is safe to run multiple times due to idempotent logic where appropriate.

# === Learning Concepts ===

LEARNING_CONCEPTS = [
  { name: "Focused Mode vs Diffuse Mode", description: "Focused mode is intense concentration on a concept. Diffuse mode is relaxed, open thinking that forms connections. Alternating enhances creativity." },
  { name: "Chunking", description: "Breaking complex ideas into manageable chunks. Helps build mental frameworks for faster understanding." },
  { name: "Procrastination & the Pomodoro Technique", description: "Procrastination blocks learning. The Pomodoro technique (25 min focus + 5 min break) helps overcome it." },
  { name: "Practice and Repetition", description: "Deliberate practice solidifies learning. Active recall is better than passive review." },
  { name: "Interleaving", description: "Mixing problem types improves adaptability and memory. Avoid practicing one topic in isolation." },
  { name: "Memory Techniques & Spaced Repetition", description: "Spaced repetition strengthens long-term memory. Memory palaces and mnemonics boost efficiency." },
  { name: "Overcoming Fear and Math Anxiety", description: "Mindset shifts and embracing mistakes help reduce fear. Confidence is built by trying." },
  { name: "Metacognition", description: "Thinking about your own thinking. Monitor learning strategies, adapt, and reflect to improve." },
  { name: "Analogies and Visualization", description: "Using metaphors and mental imagery makes abstract concepts easier to understand." },
  { name: "Active Learning Strategies", description: "Learn by teaching, explaining, or doing. Passive reading ≠ real learning." },
  { name: "Growth Mindset", description: "Believing abilities grow with effort. Opposite of fixed mindset. Key to perseverance." },
  { name: "Mental Models", description: "Mental models are frameworks to understand the world. The more you have, the better your reasoning." },
  { name: "Dealing with Frustration and Stuck Points", description: "Getting stuck is part of learning. Push through confusion using breaks, mindset shifts, and persistence." },
  { name: "Sleep and Rest for Learning", description: "Sleep strengthens memory and helps solve problems. Don’t cram — nap instead!" }
]

def seed_learning_concepts
  LEARNING_CONCEPTS.each do |concept|
    LearningConcept.find_or_create_by(name: concept[:name]) do |lc|
      lc.description = concept[:description]
    end
  end
end

# === Absurd Themes ===

ABSURD_THEMES = [
  { name: "Brian Kim, the Rhino Astronaut", description: "Brian Kim, the Rhino Astronaut, who likes to train to be the first rhino on Mars. equipped with a kinesiology degree and deep understanding of 'story of b' by Daniel Quinn" },
  { name: "Emmanuel, the Time Traveling Health Detective", description: "Emmanuel, the Time Traveling Health Detective, who uses his knowledge of fizzy soda and nutrition to solve health mysteries of famous figures throughout time." },
  { name: "Squirrelversity: The Nuttiest Ivy League",
    description: "Where tenured squirrels chase truth up trees and debate philosophy on power lines. Acornomics 101? Mandatory."
  },
  {
    name: "Quantum Buccaneers of the Andromeda Rift",
    description: "Space pirates sail gravity waves, cracking cosmic codes and plundering wormholes for ancient math relics."
  },
  {
    name: "Abyssal Academia: The Coral Council",
    description: "In a sunken empire lit by bioluminescent syllabi, octopus deans grade homework on kelp scrolls—one ink splatter at a time."
  },
  {
    name: "Intergalactic Toddlerverse: Crayons & Quarks",
    description: "Alien preschoolers in anti-gravity cribs chew on string theory and burp the Fibonacci sequence."
  },
  {
    name: "The Whispering Archives",
    description: "A haunted library where theorems scribble themselves in the air, and spectral tutors teach calculus by candlelight."
  },
  {
    name: "The Veggie Think Tank™",
    description: "Radical roots with radical ideas—Professor Parsnip explains multivariable regression while Broccoli runs bootcamp in Bayesian logic."
  },
  {
    name: "ChronoKnights & the Logic Engine",
    description: "Steel-clad philosophers wielding holographic swords debate Descartes and GPTs in the halls of Neo-Camelot."
  },
  {
    name: "Meowliament: The Feline Federation",
    description: "Cat congressmembers nap on constitutions, pass laws of thermomeowdynamics, and purr over policy matrices."
  },
  {
    name: "NeuroBeetles: The Brainwave Tour",
    description: "An insectoid rock band touring synaptic arenas, shredding on neuron-shaped guitars, and jamming on the nature of consciousness."
  },
  {
    name: "Dessertopia: The Sweet Science Society",
    description: "Gingerbread generals and cupcake chemists host sugar-fueled debates on entropy, emulsification, and edible fractals."
  }

]

def seed_absurd_themes
  ABSURD_THEMES.each do |theme|
    AbsurdTheme.find_or_create_by!(name: theme[:name]) do |at|
      at.description = theme[:description]
    end
  end
end

# === Run Seeds ===

seed_learning_concepts
seed_absurd_themes

puts "Seeded #{LearningConcept.count} learning concepts and #{AbsurdTheme.count} absurd themes."
