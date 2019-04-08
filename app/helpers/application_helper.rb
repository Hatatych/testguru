module ApplicationHelper
  FLASH_TO_BOOTSTRAP = {
    notice: 'alert alert-primary',
    success: 'alert alert-success',
    error: 'alert alert-danger',
    alert: 'alert alert-warning'
}.freeze

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
    FLASH_TO_BOOTSTRAP[level.to_sym]
  end
end
