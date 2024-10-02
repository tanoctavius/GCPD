module ApplicationHelper
  # a helper to get the right date (either opened or closed)
  def display_date(investigation, state)
    if state == "open"
      display = investigation.date_opened.strftime("%m/%d/%y")
    else
      display = investigation.date_closed.strftime("%m/%d/%y")
    end
    display
  end

  # a helper to format SSN
  def number_to_ssn(num)
    "#{num[0..2]}-#{num[3..4]}-#{num[5..8]}"
  end

end
