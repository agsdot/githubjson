class OctoutputController < ApplicationController

  def statusboard
    client = Octokit::Client.new(:login => "#{ENV['GITHUB_USERNAME']}", :oauth_token => "#{ENV['GITHUB_OAUTH_TOKEN']}")
      # c = client.follow("mojombo")
      # c = client.repo("pengwynn/octokit")
      # c = client.following("agsdot")
    c = client.commits("agsdot/gaMapQuery")
      # Octokit.commits("pengwynn/octokit")
      # client.commit("pengwynn/octokit") is the same as the above line, but won't hit API limit

    json = {'Monday' => 0, 'Tuesday' => 0, 'Wednesday' => 0, 'Thursday' => 0, 'Friday' => 0, 'Saturday' => 0, 'Sunday' => 0}
    c.each do |item|
      date = item['commit']['committer']['date']
      dayofweek = Time.parse(date).strftime('%A')
      json[ dayofweek ] += 1 # item['value'] # or something
    end

    render :json =>

    {
      "graph" => {
          "title" => "Git Commits",
          "type" => "bar",
          "datasequences" => [
            {
              "title" => "Take me to GA",
              "datapoints" => [
                  { "title" => "#{json.keys[0]}", "value" => "#{json['Monday']}"},
                  { "title" => "#{json.keys[1]}", "value" => "#{json['Tuesday']}"},
                  { "title" => "#{json.keys[2]}", "value" => "#{json['Wednesday']}"},
                  { "title" => "#{json.keys[3]}", "value" => "#{json['Thursday']}"},
                  { "title" => "#{json.keys[4]}", "value" => "#{json['Friday']}"},
                  { "title" => "#{json.keys[5]}", "value" => "#{json['Saturday']}"},
                  { "title" => "#{json.keys[6]}", "value" => "#{json['Sunday']}"}

              ]
            }

          ]

      }
    }
  end

end
