module FeedsHelper
  def choose_create_or_edit
    if action_name == 'new' || action_name == 'create'
      feeds_path
    elsif action_name == 'edit'
      feed_path
    end
  end
end
