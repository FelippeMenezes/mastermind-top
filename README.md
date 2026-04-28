# Mastermind — The Odin Project
 
> A command-line implementation of the classic code-breaking game **Mastermind**, built with Ruby as part of [The Odin Project](https://www.theodinproject.com/lessons/ruby-mastermind) curriculum.
 
---
 
## Preview
 
```
------ Mastermind - The Odin Project --------
Round 1: [ 1 2 3 4 ] - Feedback: [ X  0 ]
Round 2: [ 1 5 3 6 ] - Feedback: [ X  X  0 ]
Round 3: [ 1 5 6 6 ] - Feedback: [ X  X  X  X ]
---------------------------------------------
```
 
---
 
## How to Play
 
**Mastermind** is a code-breaking game for two players — you and the computer.
 
- A secret code is made of **4 digits**, each ranging from **1 to 6**. Repetition is allowed.
- After each guess, feedback is given:
  - `X` (green) → correct digit in the **correct position**
  - `0` (yellow) → correct digit in the **wrong position**
  - _(nothing)_ → digit is not in the code
- You have **15 rounds** to crack the code.
---
 
## Game Modes
 
| Mode | Description |
|------|-------------|
| **Guesser** | The computer generates a secret code. You try to crack it within 15 rounds. |
| **Creator** | You define the secret code. The computer tries to crack yours. |
 
---
 
## Installation & Usage
 
**Prerequisites:** Ruby >= 3.0
 
```bash
# Clone the repository
git clone https://github.com/FelippeMenezes/mastermind-top.git
cd mastermind-top
 
# Install dependencies
bundle install
 
# Run the game
ruby main.rb
```
 
---
 
## Technical Highlights
 
### Object-Oriented Design
 
The project is structured around **4 single-responsibility classes**, each encapsulating its own domain:
 
| Class | Responsibility |
|-------|---------------|
| `Player` | Handles all player state and input (name, role, guesses) |
| `Computer` | Manages the computer opponent (name, secret code generation) |
| `Board` | Stores and displays the game history (guesses + feedback) |
| `Match` | Orchestrates the game loop and business rules |
 
### Key Ruby Concepts Applied
 
- **Factory Methods** (`Computer.create_computer`, `Board.create_board`) — Class-level constructors that encapsulate creation logic, keeping initialization clean and expressive.
- **Keyword arguments with defaults** in `Match.new` (`match_secret_code:`, `feed_back:`, `round:`) — Improves readability and avoids positional argument confusion.
- **`attr_accessor`** — Generates getters and setters, exposing only what needs to be exposed.
- **Regex Input Validation** (`/^[1-6]{4}$/`) — Ensures user input is exactly 4 digits within the valid range before processing. Recursive re-prompt on invalid input.
- **`Array#tally`** — Counts element occurrences in a single pass (`[1,2,2,3].tally # => {1=>1, 2=>2, 3=>1}`), used in the feedback algorithm to handle duplicate digits correctly.
- **`Array#zip`** — Pairs guesses with their feedback arrays for clean board rendering (`guesses.zip(feedbacks).each_with_index`).
- **`Array#chars` + `map(&:to_i)`** — Converts a string guess like `"1234"` into `[1, 2, 3, 4]` in a single idiomatic pipeline.
- **`Enumerable#each_with_index`** — Used for round-number display during board rendering.
- **Private methods** — Internal logic (`spinner_computer`, `check_player_input`, etc.) is hidden from the public interface, enforcing encapsulation.
### Mastermind Feedback Algorithm
 
The feedback engine handles the tricky case of **duplicate digits** correctly — a common implementation pitfall:
 
```ruby
# Step 1: Count exact matches (right digit, right position)
exact_matches = guess.each_with_index.count { |digit, i| digit == secret[i] }
 
# Step 2: Count total digit overlap using tally (handles duplicates)
total_common = guess.tally.sum do |digit, count|
  [count, secret.tally[digit].to_i].min
end
 
# Step 3: Wrong-position matches = total overlap minus exact matches
wrong_position = total_common - exact_matches
```
 
This avoids double-counting: if the secret is `[1,1,2,3]` and the guess is `[1,1,1,1]`, the algorithm correctly returns 2 exact matches and 0 wrong-position, not 4.
 
## Tech Stack
 
| Tool | Purpose |
|------|---------|
| **Ruby** | Core language |
| **Colorize** | Terminal color output |
| **RuboCop** | Static analysis & style enforcement (Ruby community style guide) |
| **Bundler** | Dependency management via `Gemfile` / `Gemfile.lock` |
 
---
 
## Project Structure
 
```
mastermind-top/
├── lib/
│   ├── board.rb      # Board display and history
│   ├── computer.rb   # Computer player logic
│   ├── match.rb      # Game loop and rules engine
│   └── player.rb     # Player input and strategy
├── main.rb           # Entry point
├── Gemfile
├── Gemfile.lock
└── README.md
```
