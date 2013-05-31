class Octoutput
  # attr_accessible :title, :body

  def fetch_commits
    client = Octokit::Client.new(:login => "#{ENV['GITHUB_USERNAME']}", :oauth_token => "#{ENV['GITHUB_OAUTH_TOKEN']}")
    c = client.commits("agsdot/mprss")
    json = {'Monday' => 0, 'Tuesday' => 0, 'Wednesday' => 0, 'Thursday' => 0, 'Friday' => 0, 'Saturday' => 0, 'Sunday' => 0}
    c.each do |item|
      date = item['commit']['committer']['date']
      dayofweek = Time.parse(date).strftime('%A')
      json[ dayofweek ] += 1
    end

    json


  end


end
