module ApplicationHelper
  def width_brogress_bar(referals_cout, max_referals_count)
    referals_cout >= max_referals_count ? 1120 : 1100 / max_referals_count * referals_cout + 20
  end
end
