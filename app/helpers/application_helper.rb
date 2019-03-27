module ApplicationHelper
  def current_year
    Time.now.year
  end

  def create_github_link(author_name, repo_name)
    "<a target=\"_blank\" href=\"https://github.com/#{author_name}/#{repo_name}\">Автор: #{author_name}</a>".html_safe
  end
end
