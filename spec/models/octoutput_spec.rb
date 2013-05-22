require 'spec_helper'

describe Octoutput do

  it "returns a json hash" do
    commits = Octoutput.new
    commits = commits.fetch_commits
    # get :fetch_commits
    # client = Octokit::Client.new(:login => "#{ENV['GITHUB_USERNAME']}", :oauth_token => "#{ENV['GITHUB_OAUTH_TOKEN']}")
    # c = client.commits("agsdot/gaMapQuery")
    expect(commits).to be_a Hash

  end


end
