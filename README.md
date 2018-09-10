<h2>@Git&Github</h2>
    git init<br>
    git add README.md<br>
    git commit -m "first commit"<br>
    git remote add origin https://github.com/jungwoo0716/memoapp_op.git<br>
    git push -u origin master<br>
    

<h2> 1. MemoApp(1) </h2>

    Gemfile 추가 | gem 'bootstrap-sass', '~> 3.3.7'    
    application.scss | css 작성 - body, #logo  
    routes.rb 루트 추가 | root 'home#index' 
    application.html.erb 작성 
    _header.html.erb | <%=render 'layouts/header'%> 로 옮기기

<h2>2. MemoApp(2)</h2>

    Gemfile 추가 | gem 'devise'
    rails g devise:install
    rails g devise:views <--> rails d devise:views
    rake db:migrate <--> rake db:drop
    rails s | 레일즈 서버 시작
    rake routes | grep user 
    _header에 sign in & up, Logout 조건문 작성
    Gemfile 추가 | gem 'devise-bootstrap-views' ==> 기존 views가 존재하면 안됨
    rails g devise:views:bootstrap_templates
    rails g model Memo title:string content:text user:references
    rake db:migrate
        
    form_for 만들기
    rails g controller memos index new create edit update destroy
    routes.rb | 추가 resources
    memo의 new.html.erb 작성
    Gemfile 추가 | gem 'bootstrap-form' new.html.erb에 bootstrap_form_for
    Gemfile 추가 | gem 'tinymce-rails'
    
<h2>3. MemoApp(3)</h2>
    memo의 new html에 hidden_field추가 (user id용)
    memos_controller에 def create 추가
    memos_controller에 def show 추가
    memo의 show html 추가
    
    div.table-responsive>table.table.table-fit 이러고 Tab누르면 자동완성
    
    routes.rb | root를 memo로 변경
    home controller 삭제 | rails d controller home
    

4. 
