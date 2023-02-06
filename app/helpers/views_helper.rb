module ViewsHelper
  def ot(argument, capitalize=true)
    # Translates an array of options
    # [:one, :two] => [["One", :one], ["Two", :two]]
    
    if argument.is_a?(Array)
      argument.map { |value| [capitalize ? ct(value) : t(value), value] }
    else
      Rails.logger.info "Input is not an Array"
      argument
    end
  end

  def ct(string)
    return t(string).capitalize if I18n.exists?(string, locale: I18n.locale)
    string.capitalize
  end
end
