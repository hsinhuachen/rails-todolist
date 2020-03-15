## 建立使用者登入

#### Gem
	gem 'bcrypt', '~> 3.1.7'

#### 建立使用者模組
	rails g model user name:string email:string password_digest:string

#### 使用者模組中引入 has_secure_password 
	class User < ApplicationRecord
		has_secure_password
	end

### 實現註冊功能
	rails g controller applicants new create
new: 用來處理註冊介面  
create: 用來儲存註冊資訊

### 新增router
	post 'applicants/create'

### Controller
	class ApplicantsController < ApplicationController
	  def new
	  	@user = User.new
	  end

	  def create
	  	@user = User.create(user_params)
		if @user.save
			redirect_to :sessions_new
		else
			render "new"
		end
	  end

	  private
	  def user_params
	  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end
	end

### view
	<h1>註冊</h1>
	<% if @user.errors.any? %>
	<ul>
	<% @user.errors.full_messages.each do |message| %>
	<li><%= message %></li>
	<% end %>
	</ul>
	<% end %>
	<%= form_for @user, url: :applicants_create do |f| %>
	<p>
	<%= f.label :name %>
	<%= f.text_field :name %>
	</p>
	<p>
	<%= f.label :password %>
	<%= f.password_field :password %>
	</p>
	<p>
	<%= f.label :password_confirmation %>
	<%= f.password_field :password_confirmation %>
	</p>
	<p><%= f.button "提交" %></p>
	<% end %>

### 實現登入功能
#### 建立一個 Session 控制器用來處理使用者登入和退出:
	rails g controller sessions new create
new: 用來處理登入介面  
create 用來處理登入流程

### 新增router
	post 'sessions/create'

### Controller
	class SessionsController < ApplicationController
		def new
		end
		def create
			user = User.find_by(name: user_params[:name]).try(:authenticate, user_params[:password])
			if user
				render plain: sprintf("welcome, %s!", user.name)
			else
				flash.now[:login_error] = "invalid username or password"
				render "new"
			end
		end

		private
		def user_params
			params.require(:session).permit(:name, :password)
		end
	end

### view
	<div class="container">
		<h1>登入</h1>
		<% if flash[:login_error] %>
		<p><%= flash[:login_error] %></p>
		<% end %>
		<%= form_for :session, url: :sessions_create do |f| %>
		<div class="form-group">
			<%= f.label :name %>
			<%= f.text_field :name %>
		</div>
		<div class="form-group">
			<%= f.label :password %>
			<%= f.password_field :password %>
		</div>
		<p><%= f.button "登入" %></p>
		<% end %>
	</div>


