module ApplicationHelper
  def user_color(user)
    colors = ['#FF5733', '#33FF57', '#3357FF', '#F0A500', '#A500F0', '#00F0A5']
    index = user.email[0].ord % colors.length
    colors[index]
  end
end
