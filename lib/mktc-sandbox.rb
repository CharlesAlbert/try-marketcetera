require 'sandbox'

class MktcSandbox

  def self.eval code
    new_sandbox.eval code
  end

  def self.new_sandbox
    return @sandbox if defined? @sandbox
    @sandbox = Sandbox.new
    @sandbox.eval("# encoding: utf-8")

    Dir[File.join(Rails.root, "lib/jars/marketcetera/{*.jar,*/*.jar}")].each do |file|
      puts file
      @sandbox.load file
    end
    @sandbox.eval("require 'java'")
    @sandbox
  end
end
