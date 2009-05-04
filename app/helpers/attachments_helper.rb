module AttachmentsHelper
  def choose_icon(mime_type)
    case mime_type
      when /\.doc|odf|txt/ then "xls.png"
      when /\.pdf/ then "pdf.png"
      when /\.xls/ then "ods.png"
      else "documents.png"
    end
  end
end
