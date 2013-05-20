require 'spec_helper'

describe OctoutputController do


  it "responds successfully to morris with an HTTP 200 status code" do
    get :morris
    expect(response).to be_success
    expect(response.status).to eq 200
  end

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

  it "expects a ____ result for statusboard" do
    pending
    #       get :data
    #       @data = assigned(:data)
    #       @response = response
    #     end

    #       expect(@data)["graph"]["datasequence"]).to be_an Array (or Hash)
    #                         to eq "Rattings of Top 10"
    # pending
    get :statusboard
    # @output = assigned(:output)
    # expect(@output)["graph"]["datasequence"].to be_an Array

    expect(@output.inspect)["graph"]["datasequence"].to be_an Array

  end

  it "delivers an an array for morris output" do
    get :morris
    commits = Octoutput.new
    json = commits.fetch_commits
    output =
            [
                { "title" => "#{json.keys[0]}", "value" => json['Monday']},
                { "title" => "#{json.keys[1]}", "value" => json['Tuesday']},
                { "title" => "#{json.keys[2]}", "value" => json['Wednesday']},
                { "title" => "#{json.keys[3]}", "value" => json['Thursday']},
                { "title" => "#{json.keys[4]}", "value" => json['Friday']},
                { "title" => "#{json.keys[5]}", "value" => json['Saturday']},
                { "title" => "#{json.keys[6]}", "value" => json['Sunday']}

            ]
    expect(output).to be_an Array
  end


end
