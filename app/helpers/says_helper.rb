module SaysHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_says_path
    elsif action_name == 'edit'
      say_path
    end
  end
end
