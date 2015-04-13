module DateFormatter
  def readable_date(date)
    return nil if date.blank?
    date.strftime("%m/%d/%Y")
  end
end