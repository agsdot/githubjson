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
    expect(assigns(:json)).to be_a Hash
  end

  it "expects an Array result for statusboard datasequence" do
    get :statusboard
    expect(assigns(:output)["graph"]["datasequences"]).to be_an Array

  end

  it "delivers an an array for morris output" do
    get :morris
    expect(assigns(:output)).to be_an Array
  end


end
