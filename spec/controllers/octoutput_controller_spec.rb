require 'spec_helper'

describe OctoutputController do
  # it "should be test" do
  #   puts "i am a test"
  #   expect(true).to eq true
  # end

  it "responds successfully to morris with an HTTP 200 status code" do
    get :morris
    expect(response).to be_success
    expect(response.status).to eq 200
  end

  # it "returns a JSON object" do
  #   get '/morris.json'
  #   response(response).to eq 'json'
  # end
  it "responds successfully to statusboard with an HTTP 200 status code" do
    get :statusboard
    expect(response).to be_success
    expect(response.status).to eq 200
  end

  it "gets a json hash for statusboard" do
    get :statusboard
    commits = Octoutput.new
    json = commits.fetch_commits
    expect(json).to be_a Hash
  end



end
