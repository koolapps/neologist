Rails.application.routes.draw do

  mount Rust::Engine => "/rust"
end
