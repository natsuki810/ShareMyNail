module Admin::ReportsHelper
  def target_link(report)
    if report.design.present?
      link_to "デザイン", admin_design_path(report.design.id)
    # elsif report.comment.present?
    #   link_to "コメント", admin_design_path(report.comment)
    # elsif report.reply.present?
    #   link_to "返信", admin_report_path(report.reply.comment.id, report.reply.id)
    else
      "削除済"
    end
  end
end
