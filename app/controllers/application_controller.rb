class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :current_user

  def set_locale
    I18n.locale = session[:locale] || default_locale
  end

  def set_session_locale
    session[:locale] = params[:locale]
    set_locale
    respond_to do |format|
      format.js { render nothing: true }
    end
  end

  private

  def default_locale
    {
      AE: :ar, KW: :ar, IQ: :ar, SA: :ar, EG: :ar, TN: :ar, DZ: :ar, PS: :ar, JO: :ar, SY: :ar, LB: :ar, MA: :ar, OM: :ar, YE: :ar, AZ: :az, BD: :bn, CH: :de, AT: :de, DE: :de, GR: :el, CY: :el, US: :en, GB: :en, AU: :en, CA: :en, NZ: :en, ZA: :en, NG: :en, PH: :en, MX: :es, HN: :es, PA: :es, CR: :es, NI: :es, SV: :es, PR: :es, DO: :es, BO: :es, EC: :es, VE: :es, CO: :es, CL: :es, PE: :es, AR: :es, GT: :es, ES: :es, UY: :es, PY: :es, IR: :fa, HT: :fr, FR: :fr, IN: :hi, AM: :hy, ID: :id, IT: :it, JP: :ja, GE: :ka, KZ: :kk, KR: :ko, MY: :ms, BR: :pt, RU: :ru, SE: :sv, TJ: :tg, TH: :th, TM: :tk, TR: :tr, PK: :ur, UZ: :uz, VN: :vi, CN: :zh
    }[:SE || request.location.country_code] || :en
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
