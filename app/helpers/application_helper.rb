module ApplicationHelper
  def current_year
    Time.current.year
  end

  def create_github_link(author_name, repo_name)
    link_to "#{I18n.t('shared.footer.author_title')}#{author_name}", "https://github.com/#{author_name}/#{repo_name}"
  end

  def flash_alert(message)
    flash[:alert] = message
  end

  def flash_class(level)
    case level
    when 'notice' then 'alert alert-primary'
    when 'success' then 'alert alert-success'
    when 'error' then 'alert alert-danger'
    when 'alert' then 'alert alert-warning'
    end
  end
end
