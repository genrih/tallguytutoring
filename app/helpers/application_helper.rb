module ApplicationHelper
  def width_brogress_bar(referals_cout, max_referals_count)
    referals_cout >= max_referals_count ? 100 : 90 / max_referals_count * referals_cout + 10
  end
end
