module ApplicationHelper
  def cool_user_input(user_input)
    if user_input.include? "**"
      user_input.gsub!(/\*\*.*?\*\*/) do |match|
        "<b>"+match.split('**').join('')+"</b>"
      end
    elsif user_input.include? "\\"
      user_input.gsub!(/\\.*?\\/) do |match|
        "<i>"+match.split('\\').join('')+"</i>"
      end
    elsif user_input.include? "(("
      user_input.gsub!(/\(\(.*?\s/) do |match|
        "<a href='"+match.split(/[(\s]/).join('')+"'>"
      end
      user_input.gsub!(/[>].*?\)\)/) do |match|
        match.split(/[)]/).join('')+"</a>"
      end
    end
    user_input
  end
end
