require "sinatra"
require "sinatra/activerecord"
require_relative "./lib/Kanban.rb"

class Server < Sinatra::Base
    get "/boards" do
        erb :boards, locals: {boards: Board.all}
    end
    post "/boards" do
        Board.create(title: params['title'], last_viewed: Time.now.to_s)
        erb :boards, locals: {boards: Board.all}
    end
    get "/members/new" do
        erb :members
    end
    
end
