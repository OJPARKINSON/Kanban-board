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
    post "/members/new" do
        Member.create(name: params['name'])
        erb :members
        redirect "/boards"
    end
    get "/board/:id" do |id|
        erb :board, locals: {board: Board.find(id)}
    end
    post "/board/:id/tasks" do |id|
        Task.create(status: 'todo', board_id: id, member_id: 1, text: params['text'])
        erb :board, locals: {board: Board.find(id)}
    end
end
