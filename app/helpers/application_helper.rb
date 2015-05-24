# encoding: UTF-8
module ApplicationHelper

def with_new_lines(string)
   (h(string).gsub(/\n/, '<br/>')).html_safe
end


def day_distance(dt)
  n = (Time.now.to_date - dt.to_date).to_i
  if dt.wday == 2
     	zz = "o"
  else
     	zz = ""
  end

  case n
  when 0
        rt = "сегодня"
  when 1
     	rt = "вчера"
  when 2..6
        rt = "в" + zz + " " + week_day(dt.wday)
  else
        rt = n.to_s + " " + "дней назад"
  end
  return rt
end



def week_day(dd)
  case dd
    when 0
     tr = "воскресенье"
    when 1
     tr = "понедельник" 	
    when 2 
     tr = "вторник"  	 
    when 3
     tr = "среду"
    when 4
     tr = "четверг"
    when 5
     tr = "пятницу"
    else
     tr = "субботу"
   end
  return tr
  end 


end
