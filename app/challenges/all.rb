require "mktc-sandbox"
Challenges = [ ]
def challenge opts
  challenge = Class.new
  opts[:level] = Challenges.size + 1
  opts.each do |opt, with_value|
    challenge.define_singleton_method opt, lambda { with_value }
  end
  challenge.define_singleton_method :to_s, lambda { [self.level,self.title].join(" - ") }

  if not challenge.code_challenge.include? GameChallenge::COMMENT
    puts "You forgot to put #{ GameChallenge::COMMENT} in the code"
    puts __FILE__
    puts challenge.code_challenge
    raise 'wtf!'
  end
  compiled_valid_code = challenge.code_challenge.gsub(GameChallenge::COMMENT, challenge.valid_answer)
  MktcSandbox.eval compiled_valid_code
  Challenges << challenge
end
Challenges.class_eval do
  def get_level level
    find {|challenge|challenge.level == level} or
    raise "There's no level #{level} on #{Challenges.collect(&:level).inspect}"
  end
end
challenges = %w(
 wellcome
 on_start
)
=begin
 start_logging_yourself
 understanding_the_environment
 connecting_things
 connect_the_market_data
)
=end
challenges.each do |challenge|
  require challenge
end
