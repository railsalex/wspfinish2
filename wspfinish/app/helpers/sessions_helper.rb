module SessionsHelper

  def sign_in(user)
    cookies[:remember_token] = { value:   user.remember_token,
                                 expires: 1.months.from_now }
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end


  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def render_smaller_content
    params[:smaller_width] = true
  end
end