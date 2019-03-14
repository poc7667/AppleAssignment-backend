class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
