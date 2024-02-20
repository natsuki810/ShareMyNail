module Admin::ReportsHelper
  def target_link(report)
    if report.design.present?
      link_to "デザイン", admin_report_path(report.id)
    elsif report.comment.present?
      link_to "コメント", admin_report_path(report.id)
    elsif report.reply.present?
      link_to "返信", admin_report_path(report.id)
    else
      "削除済"
    end
  end

  def task_link(report)
    if report.status == true
      "<i class='fa-solid fa-square-check'></i>対応済".html_safe
    elsif report.design.nil? && report.reply.nil? && report.comment.nil?
      "<i class='fa-solid fa-square-check'></i>対応済".html_safe
    else
      "<i class='fa-regular fa-square-check'></i>".html_safe
    end
  end

  def is_task_link(report)
    if report.status == true
      return false
    elsif report.design.nil? && report.reply.nil? && report.comment.nil?
      return false
    else
      return true
    end
  end

end
