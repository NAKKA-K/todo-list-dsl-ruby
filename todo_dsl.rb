require 'date'

def todo_list(&block)
    yield if block_given?
end

def todo(task_name, deadline: nil)
    now = Date.today
    task_deadline = Date.parse(deadline)
    if now > task_deadline
        puts "! [Emergency] #{task_name} の期限が切れています"
	print "締め切りから", (now - task_deadline).to_i, "日過ぎています\n"
    else
        puts "[Notification] #{task_name}"
        print "締め切りまでの残り日数は", (task_deadline - now).to_i, "日です\n"
    end
    puts
end

load 'todo_list'
