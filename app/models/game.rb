class Game < ActiveRecord::Base
  attr_accessible :username
  has_many :game_challenges 
  def start!
    start_this! Challenge.first
  end
  def next_challenge!
    start! and return if not (last_challenge = current_challenge)
    if (next_challenge = last_challenge.next_challenge)
      start_this! next_challenge
    else
      puts "You finish!"
    end
  end
  def current_challenge
    game_challenges.last.challenge if game_challenges.last
  end
  private
  def start_this! challenge
    start_it = GameChallenge.new
    start_it.challenge = challenge
    self.game_challenges << start_it
  end
end
