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
end
