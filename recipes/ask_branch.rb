namespace :deploy do
  task :set_branch do
    set :branch, prompt_branch_name
  end
  before "deploy:update" , "deploy:set_branch"
end

def prompt_branch_name
  BranchedDeploy.new.prompt
end

class BranchedDeploy
  def prompt
    begin
      branch = ask
    end # while invalid_branch? branch
    branch
  end

  private

  # => * Type branch name to deploy: (master, feature_1) |master|
  def ask
    Capistrano::CLI.ui.ask("  * Type branch name to deploy (#{git_branch.all.join(', ')}):") { |q| q.default = git_branch.current }
  end

  def invalid_branch?(branch)
    !git_branch.exists? branch
  end

  def git_branch
    @git_branch ||= GitBranch.new
  end
end

class GitBranch
  def current
     branches.detect { |branch| branch.start_with? "*" }[2..-1]
  end

  def all
    branches.collect(&removing_asterisk_from_current_branch)
  end

  def exists?(branch)
    branches.include? branch
  end

  private

  # => ["* master", "feature_1"]
  def branches
    @branches ||= `git branch`.split("\n").map(&:strip)
  end

  def removing_asterisk_from_current_branch
    lambda { |branch| branch.gsub(/^\* /,"") }
  end
end
