Rails.application.routes.draw do
#管理者用
#URL /admin/sign_in
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

#ユーザー用
#URL /customers/sign_in
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

namespace :public do#時間があればadminのnamespaceに統一する。
  get 'homes/top'
  get 'homes/about'
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
end

scope module: :public do
  root controller: :homes, action: :top
  get :about, controller: :homes, action: :about
  resources :posts, only: [:index, :show, :edit, :new, :update, :destroy, :create] do
    resources :comments#必要のない部分は後でonlyで実施する。
  end
  get 'customers' => 'customers#show'
  get 'customers/my_page' => 'customers#my_page'
  get 'customers/information/edit' => 'customers#edit'
  patch 'customers/information' => 'customers#update'
  get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
  patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
  resources :greats#必要のない部分は後でonlyで実施する。
end

namespace :admin do
  root "homes#top"
  resources :posts, only: [:index, :show, :edit, :update, :destroy]
  resources :customers, only:[:index, :show, :edit, :update, :destroy]
  resources :comments#必要のない部分は後でonlyで実施する。

end

end