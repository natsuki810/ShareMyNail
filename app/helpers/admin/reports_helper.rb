module Admin::ReportsHelper
  def target_link(report)
    if report.design.present?
      link_to "デザイン", admin_design_path(report.design.id)
    # elsif report.comment.present?
    #   link_to "コメント", admin_comment_path(report.comment.id)
    # elsif report.reply.present?
    #   link_to "返信", admin_comment_reply_path(report.reply.comment.id, report.reply.id)
    else
      "見つかりません"
    end
  end
end
