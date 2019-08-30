require_relative "../lib/Kanban"

board = Board.create(title: "test", last_viewed: Time.new.to_s)
member = Member.create(name: "mr test")
task = Task.create(status: "test", last_viewed: Time.new.to_s, text: "test", member_id: member.id, board_id: board.id)

