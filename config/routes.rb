Rails.application.routes.draw do
  devise_for :owner, skip: [:registrations, :passwords], controllers: {
  sessions: "owner/sessions"
}
  devise_for :users, skip: [:passwords,], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
