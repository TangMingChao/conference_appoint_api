require 'acceptance_helper'

resource "用户登录" do
  header "Accept", "application/json"

  # post "/users" do
  #   parameter :email, "用户注册的邮箱号", required: true, scope: :user
  #   parameter :password, "用户注册的密码", required: true, scope: :user

  #   user_attrs = FactoryGirl.attributes_for :user


  #   describe "用户注册状态" do
  #     let(:email) { user_attrs[:email] }
  #     let(:password) { user_attrs[:password] }

  #     response_field :id, "用户ID"
  #     response_field :email, "邮箱"
  #     response_field :authentication_token, "鉴权Token"
  #     response_field :created_at, "创建时间"
  #     response_field :updated_at, "更新时间"
      

  #     example "用户注册成功" do
  #       do_request
  #       puts response_body
  #       expect(status).to eq(201)
  #     end
  #   end
  # end

  post "/users/sign_in" do

    before do
      @user = create(:user)
    end

    parameter :email, "登录的邮箱号", required: true, scope: :user
    parameter :password, "登录密码", required: true, scope: :user

    user_attrs = FactoryGirl.attributes_for :user
    let(:email) { user_attrs[:email] }
    let(:password) { user_attrs[:password] }

    response_field :id, "用户ID"
    response_field :email, "邮箱"
    response_field :authentication_token, "鉴权Token"
    response_field :created_at, "创建时间"
    response_field :updated_at, "更新时间"
    

    example "用户登录成功" do
      do_request
      puts response_body
      expect(status).to eq(201)
    end

  end
 end 



##########################  管理员 ###############################


resource "管理员登录" do
  header "Accept", "application/json"

  post "/administrators/sign_in" do

    before do
      @administrator = create(:administrator)
    end

    parameter :phone, "登录的邮箱号", required: true, scope: :administrator
    parameter :password, "登录密码", required: true, scope: :administrator

    administrator_attrs = FactoryGirl.attributes_for :administrator
    let(:phone) { administrator_attrs[:phone] }
    let(:password) { administrator_attrs[:password] }

    response_field :phone, "电话号码"
    response_field :authentication_token, "鉴权Token"
    response_field :created_at, "创建时间"
    response_field :updated_at, "更新时间"
    

    example "管理员登录成功" do
      do_request
      puts response_body
      expect(status).to eq(201)
    end

  end

  #   post "/administrators" do
#     parameter :phone, "管理员注册的手机号码", required: true, scope: :administrator
#     parameter :password, "管理员注册的密码", required: true, scope: :administrator

#     administrator_attrs = FactoryGirl.attributes_for :administrator


#     describe "管理员注册状态" do
#       let(:phone) { administrator_attrs[:phone] }
#       let(:password) { administrator_attrs[:password] }

#       response_field :phone, "手机"
#       response_field :authentication_token, "鉴权Token"
#       response_field :created_at, "创建时间"
#       response_field :updated_at, "更新时间"
     
      

#       example "管理员注册成功" do
#         do_request
#         puts response_body
#         expect(status).to eq(201)
#       end
#     end
#   end
 end 