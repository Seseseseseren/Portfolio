Rails.application.routes.draw do
  devise_for :owner, skip: [:registrations, :passwords], controllers: {
  sessions: "owner/sessions"
}
  devise_for :users, skip: [:passwords,], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

namespace :owner do
    root to: 'subscriptions#index'
    resources :subscriptions do
      collection do
      get 'search' => 'searches#search'
    end
    end
    resources :genres,except:[:show,:destroy,:new]
    resources :users,except:[:new,:create,:destroy]
  end

  scope module: :user do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'inquiry' => 'inquiries#index'
    post 'inquiry/confirm' => 'inquiries#confirm'
    post 'inquiry/thanks' => 'inquiries#thanks'
    resources :subscriptions,only:[:index, :show] do
      collection do
      get 'search' => 'searches#search'
      end
      resources :reviews,only:[:create, :edit, :update, :destroy] do
        resource :favorites, only: [:create, :destroy]
      end
    end
    resource :users,only:[:edit,:update] do
      get 'mypage' => 'users#mypage'
      get 'mypage/edit' => 'users#edit'
      patch 'mypage/update' => 'users#update'
      get 'unsubscribe' => 'users#unsubscribe'
      patch 'withdraw' => 'users#withdraw'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
