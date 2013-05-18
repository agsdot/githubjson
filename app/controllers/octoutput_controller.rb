class OctoutputController < ApplicationController




  def index

  end

  def morris
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
    respond_to do |format|
      format.html
      format.json { render :json => output}
    end


  end



  def statusboard
    commits = Octoutput.new
    json = commits.fetch_commits

    output =
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

    render :json => output


  end




end
