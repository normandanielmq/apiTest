AppTest::Application.routes.draw do
  match '/tests/professor/:id(.:format)' => 'tests#get_tests_by_professor', via: :get
  resources :tests
  resources :groups
  resources :students
  resources :courses
  resources :professors
  match '/users/login(.:format)' => 'users#login', :via => :post
  match '/users/login/:UserName/:Password(.:format)' => 'users#login', :via => :get
  match '/users/change_pass/:id(.:format)' => 'users#change_pass', :via => :post
  match '/users/change_pass/:id(.:format)' => 'users#change_pass', :via => :put

  # Groups
  match '/groups/:id/students(.:format)' => 'groups#show_students'
  match '/groups/:group_id/students/:student_id(.:format)' => 'groups#remove_student_from_group', :via => :delete
  match '/groups/:group_id/students/:student_id(.:format)' => 'groups#add_student_to_group', :via => :get

  # Professors
  match '/professors/:id/groups(.:format)' => 'professors#show_groups'
  match '/professors/:id/courses(.:format)' => 'professors#show_courses'

  # Students
  match '/students/:id/groups(.:format)' => 'students#show_groups', via: :get
  match '/students/:id/tests(.:format)' => 'students#show_tests', :via => :get

  # Courses
  match '/courses/:id/groups(.:format)' => 'courses#show_groups'

  # Test
  match '/tests/:id/questions(.:format)' => 'tests#show_questions', via: :get
  match '/tests/:id/answers(.:format)' => 'tests#show_answers', via: :get
  match '/tests/:id/questions(.:format)' => 'tests#add_question', :via => :post
  match '/tests/:id/questions/:question_id(.:format)' => 'tests#remove_question', :via => :delete
  match '/tests/:id/students/:student_id/answers(.:format)' => 'tests#show_answers_by_student', via: :get
  match '/tests/:test_id/answers(.:format)' => 'tests#add_answer', :via => :post
  match '/tests/:id/time_remaining(.:format)' => 'tests#time_remaining', via: :get

  # Questions
  match '/questions/:id/answers(.:format)' => 'questions#show_answers', via: :get
  match '/questions/grade/:id' => 'questions#grade', via: :put

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
