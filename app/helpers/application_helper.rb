module ApplicationHelper
  def stc
    "#{controller_path.gsub('_', '-').gsub('/', '--')}--#{action_name}"
  end
  
  def human_time(datetime)
    datetime.strftime("%m/%d %H:%M")
  end
end
