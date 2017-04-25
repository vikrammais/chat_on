Rails.application.routes.draw do

  get 'conversations/show_messages'

  post 'conversations/send_message'

  root 'sessions#new'

  get 'user/user_data'

  get 'user/friends_list'

  get 'user_operations/search'

  get 'user_operations/send_friend_request'

  get 'user_operations/friend_request_accept'

  get 'user_operations/messages'

  get 'user_operations/notifications'

  get 'register/new'

  post 'register/create'

  get 'register/destroy'

  post 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
