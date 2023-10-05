class Public::HomesController < ApplicationController

  def guest_sign_in

    customer = Customer.find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.first_name = "guest"
      customer.last_name = "guest"
      customer.first_name_kana = "ゲスト"
      customer.last_name_kana = "ゲスト"
      customer.email = "guest@example.com"
      customer.password = "111122"
      # user.skip_confirmation!  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def top
  end

  def about
  end

end
