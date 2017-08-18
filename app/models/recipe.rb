class Recipe
  include HTTParty

   ENV['FOOD2FORK_KEY']='791c3841693c20d34bce2ea0c4407314'
   hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'

   base_uri "http://#{hostport}/api"
  default_params key: ENV['FOOD2FORK_KEY']
  format :json

  def self.for (keyword)
    get("/search", query: {q: keyword})["recipes"]
  end
end