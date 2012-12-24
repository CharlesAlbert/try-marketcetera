challenge :title => "Strategy.method(:on_start)",
  :description =>"Marketcetera has many modules to keep the code and rules clear. We'll get concentrated into the [Strategy][strategy_java_doc] module starting on the first method named on_start. These method will just log an info into our system and show you the code.",
  :code_challenge => %q{
include_class "org.marketcetera.strategy.ruby.Strategy"
class MyFirstExplorativeStrategy < Strategy
  def start
    info "I'm here starting into the wild..."
    # your code here
  end
end},
  :code_help  =>  %q{It's time to start exploring the platform. Your first challenge is learn how to know what methods you can expore. [info][strategy_info_java_doc] is one of them. Try warn or error to see what's happen! In the next step we'll start exploring each of them to build our first *interesting strategy*.},
  :tags  =>  "easy",
  :image_url  =>  "feliz.png",
  :valid_answer =>  "info(methods.inspect)"
