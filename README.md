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
    index.html 테이블 만들기
    
<h2>4. MemoApp(4)</h2>

    memos_controller에 def edit 추가
    edit.html 코드 작성
    form_html.erb 만들기 (중복 코드 없애기)
    memos_controller에 def update 추가
    memos_controller에 def destroy 추가
    memos_controller에 글을 쓴 사람만 볼 수 있게 추가
    memos_controller에 Private set_memo ==> "@memo = Memo.find(params[:id]) = set_memo"
    before_action :set_memo, only: [:show, :edit, :update, :destroy]
    private : memo_parmas추가 후 update, create 로 코드 약줄

<h2>5. MemoApp(5)</h2>

    memos_controller에 def is writer추가
    Comment Model 만들기
    rails g model comment content:string user:references memo:references
    rails g controller comments create destroy
    모델 관계/라우트 설정
    memo.rb, user.rb : has_many :comments 추가
    resources comments 추가
    show.html.erb에 댓글나오는 창 추가
    memos_controller에 show에 comment추가
    comments_controller 구현
    
<h2>6. MemoApp(6)</h2>

    유효성 검사 - validates
    validates - memo.rb, comment.rb 추가
    application.html.erb에 flash 추가
    <% type = boostrap_msg(msg_type)%> ==> boostrap_msg를 application_helper.rb에 def 추가
    <%=content_tag(:div, msg, class: ['alert', "alert-#{type}"])%>

<h2>7. MemoApp(7)</h2>

    