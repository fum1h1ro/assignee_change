class AssigneeChangeListener < Redmine::Hook::Listener
  def model_changeset_scan_commit_for_issue_ids_pre_issue_update(context={})
    issue = context[:issue]
    action = context[:action]
    Rails.logger.warn("#{context}")
    Rails.logger.warn("#{issue}: #{action}")
    if action =~ /(fix(ed|es)?|close)/
      issue.assigned_to_id = issue.author_id
    end
  end
end

