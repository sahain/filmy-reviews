module ApplicationHelper
  def page_title
    if content_for?(:title)
      "Filmy - #{content_for(:title)}"
    else
      "Filmy"
    end
  end
end
