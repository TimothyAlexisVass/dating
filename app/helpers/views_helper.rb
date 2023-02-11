module ViewsHelper
  def ot(argument, prefix=nil, capitalize=true)
    # Translates an array of options
    # [:one, :two] => [["One", :one], ["Two", :two]]

    if argument.is_a?(Array)
      argument.map {
        |value|
        prefixed = prefix.present? ? "#{prefix}.#{value}" : value
        [capitalize ? ct(prefixed) : t(prefixed), value]
      }
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
