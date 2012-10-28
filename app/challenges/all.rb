Challenges = [ ]
def challenge opts
  challenge = Class.new
  opts[:level] = Challenges.size + 1
  opts.each do |opt, with_value|
    challenge.define_singleton_method opt, lambda { with_value }
  end
  challenge.define_singleton_method :to_s, lambda { [self.level,self.title].join(" - ") }
  Challenges << challenge
end
Challenges.class_eval do
  def get_level level
    find {|challenge|challenge.level == level} or
    raise "There's no level #{level} on #{Challenges.collect(&:level).inspect}"
  end
end
challenges = %w(
  start
  set_your_username
  cog_job_is_for_you
  cog_job_recognize_different_smiles
  cog_job_recognize_different_smiles_and_eyes
  cog_job_recognize_smiles_in_reverse_mode
  do_you_wanna_continue
  cog_job_face_builder_with_noose
  cog_job_face_builder_starting_for_fun
  define_singleton_methods
) # TODO: erase these line when it grow up to 100 challenges
challenges.reverse! if Rails.env.development? #I'm aways developing the last challenge
challenges.each do |challenge|
  require challenge
end
