class AuthController < ApplicationController
  def index
    render json: {
      "status": "ok",
      "isLogin": false,
      "data": {
        "id": 1,
        "avatar": "http://avatar.com/1.png",
        "username": "hunger",
        "updatedAt": "2017-12-27T07:40:09.697Z",
        "createdAt": "2017-12-27T07:40:09.697Z"
      }
    }
  end

  def login
    s = Auth.new create_params
    s.validate
    render json: {
      "status": "ok",
      "msg": "登录成功",
      "data": {
        "id": 1,
        "username": "hunger",
        "avatar": "http://avatar.com/1.png",
        "updatedAt": "2017-12-27T07:40:09.697Z",
        "createdAt": "2017-12-27T07:40:09.697Z"
      }
    }
    # render_resource s
    # session[:current_user_id] = s.user.id
  end

  def create_params
    params.permit(:username, :password)
  end

end
