Admin.create!(:id=>1,:login_id=>'admin',:email => 'admin@sleepinglion.pe.kr',:nickname=>'관리자',:password => 'a12345', :password_confirmation => 'a12345',:photo=>File.open(Rails.root.join("app","assets", "images", "dog.png")))
Admin.create!(:id=>2,:parent_id=>1,:login_id=>'sub_admin',:nickname=>'서브관리자',:password => 'a12345', :password_confirmation => 'a12345',:photo=>File.open(Rails.root.join("app","assets", "images", "dog.png")))
Admin.create!(:id=>3,:parent_id=>1,:login_id=>'operator',:nickname=>'Operator',:password => 'a12345', :password_confirmation => 'a12345',:photo=>File.open(Rails.root.join("app","assets", "images", "dog.png")))
Admin.create!(:id=>4,:parent_id=>1,:login_id=>'exporter',:nickname=>'exporter',:password => 'a12345', :password_confirmation => 'a12345',:photo=>File.open(Rails.root.join("app","assets", "images", "dog.png")))
Admin.create!(:id=>5,:parent_id=>1,:login_id=>'reader',:nickname=>'Reader',:password => 'a12345', :password_confirmation => 'a12345',:photo=>File.open(Rails.root.join("app","assets", "images", "dog.png")))

Role.create!(:id=>1,:title=>'administrator')
Role.create!(:id=>2,:title=>'operator')
Role.create!(:id=>3,:title=>'exporter')
Role.create!(:id=>4,:title=>'reader')

RolesAdmin.create!(:role_id=>1,:admin_id=>1)
RolesAdmin.create!(:role_id=>1,:admin_id=>2)
RolesAdmin.create!(:role_id=>2,:admin_id=>3)
RolesAdmin.create!(:role_id=>3,:admin_id=>4)
RolesAdmin.create!(:role_id=>4,:admin_id=>5)

Education.create!(:id=>1,:title=>'정규교육 받지않음',:enable=>true)
Education.create!(:id=>2,:title=>'초등학교 졸업',:enable=>true)
Education.create!(:id=>3,:title=>'중학교 졸업',:enable=>true)
Education.create!(:id=>4,:title=>'고등학교 졸업',:enable=>true)
Education.create!(:id=>5,:title=>'대학교 졸업',:enable=>true)
Education.create!(:id=>6,:title=>'대학원 졸업',:enable=>true)

Job.create!(:id=>1,:title=>'자영업',:enable=>true)
Job.create!(:id=>2,:title=>'주부',:enable=>true)
Job.create!(:id=>3,:title=>'농업',:enable=>true)
Job.create!(:id=>4,:title=>'상업',:enable=>true)
Job.create!(:id=>5,:title=>'건설업',:enable=>true)
Job.create!(:id=>6,:title=>'중공업',:enable=>true)
Job.create!(:id=>7,:title=>'정보통신/IT',:enable=>true)
Job.create!(:id=>8,:title=>'교육/연구/학생',:enable=>true)
Job.create!(:id=>9,:title=>'문화/미디어/창작',:enable=>true)

LiveType.create!(:id=>1,:title=>'독거',:enable=>true)
LiveType.create!(:id=>2,:title=>'동거',:enable=>true)

FamilyCategory.create!(:id=>1,:title=>'여자 형제',:enable=>true)
FamilyCategory.create!(:id=>2,:title=>'남자 형제',:enable=>true)
FamilyCategory.create!(:id=>3,:title=>'딸',:enable=>true)
FamilyCategory.create!(:id=>4,:title=>'아들',:enable=>true)

QuestionCategory.create!(:id=>1,:title=>'신체적 특성 / 생활 습관',:enable=>true)
QuestionCategory.create!(:id=>2,:title=>'식습관에 관한 문항',:enable=>true)
QuestionCategory.create!(:id=>3,:title=>'여성건강에 관한 문항',:female_only=>true,:enable=>true)


Question.create(:id=>1,:question_category_id=>1,:title=>'혈액형 에 대해서 표시해 주십시오.',:enable=>true)
QuestionDescription.create(:question_id=>1,:description=>'정확히 모를경우는 모른다에 표시하세요');
Question.create(:id=>2,:question_category_id=>1,:title=>'현재 키(cm)에 대해서 표시해 주십시오',:enable=>true)
Question.create(:id=>3,:question_category_id=>1,:title=>'현재 몸무게(kg)에 대해서 표시해 주십시오',:enable=>true)
Question.create(:id=>4,:question_category_id=>1,:title=>'왼손잡이입니까? 아니면 오른손잡이입니까?',:enable=>true)
Question.create(:id=>5,:question_category_id=>2,:title=>'당신의 눈 색깔은?',:enable=>true)
Question.create(:id=>6,:question_category_id=>2,:title=>'당신의 머리카락 상태는?',:enable=>true)
Question.create(:id=>7,:question_category_id=>2,:title=>'흡연을 합니까?',:enable=>true)
Question.create(:id=>8,:question_category_id=>2,:title=>'현재 음주를 합니까?',:enable=>true)
Question.create(:id=>9,:question_category_id=>3,:title=>'생리는 규칙적입니까?',:enable=>true)
Question.create(:id=>10,:question_category_id=>3,:title=>'출산을 했습니까?',:enable=>true)

Answer.create!(:id=>1,:question_id=>1,:title=>'A형',:enable=>true)
Answer.create!(:id=>2,:question_id=>1,:title=>'B형',:enable=>true)
Answer.create!(:id=>3,:question_id=>1,:title=>'O형',:enable=>true)
Answer.create!(:id=>4,:question_id=>1,:title=>'AB형',:enable=>true)
Answer.create!(:id=>5,:question_id=>1,:title=>'혈액형 모른다',:enable=>true)
Answer.create!(:id=>6,:question_id=>1,:title=>'기타 특이 혈액형',:enable=>true)

Answer.create!(:id=>7,:question_id=>2,:title=>'130cm 이하',:enable=>true)
Answer.create!(:id=>8,:question_id=>2,:title=>'131~140cm',:enable=>true)
Answer.create!(:id=>9,:question_id=>2,:title=>'141~150cm',:enable=>true)
Answer.create!(:id=>10,:question_id=>2,:title=>'151~160cm',:enable=>true)
Answer.create!(:id=>11,:question_id=>2,:title=>'161~170cm',:enable=>true)
Answer.create!(:id=>12,:question_id=>2,:title=>'171~180cm',:enable=>true)
Answer.create!(:id=>13,:question_id=>2,:title=>'181~190cm',:enable=>true)
Answer.create!(:id=>14,:question_id=>2,:title=>'191~200cm',:enable=>true)
Answer.create!(:id=>15,:question_id=>2,:title=>'201cm 이상',:enable=>true)

Answer.create!(:id=>16,:question_id=>3,:title=>'40kg 미만',:enable=>true)
Answer.create!(:id=>17,:question_id=>3,:title=>'41~50kg',:enable=>true)
Answer.create!(:id=>18,:question_id=>3,:title=>'51~60kg',:enable=>true)
Answer.create!(:id=>19,:question_id=>3,:title=>'61~70kg',:enable=>true)
Answer.create!(:id=>20,:question_id=>3,:title=>'71~80kg',:enable=>true)
Answer.create!(:id=>21,:question_id=>3,:title=>'81~90kg',:enable=>true)
Answer.create!(:id=>22,:question_id=>3,:title=>'91~100kg',:enable=>true)
Answer.create!(:id=>23,:question_id=>3,:title=>'100kg 초과',:enable=>true)

Answer.create!(:id=>24,:question_id=>4,:title=>'오른손잡이',:default=>true,:enable=>true)
Answer.create!(:id=>25,:question_id=>4,:title=>'왼손잡이',:enable=>true)
Answer.create!(:id=>26,:question_id=>4,:title=>'양손잡이',:enable=>true)
Answer.create!(:id=>27,:question_id=>4,:title=>'왼손잡이였는데 오른손을 사용하도록 교육받았다',:enable=>true)
Answer.create!(:id=>28,:question_id=>4,:title=>'오른손잡이였는데 왼손을 사용하도록 교육받았다',:enable=>true)

Answer.create!(:id=>29,:question_id=>5,:title=>'갈색',:enable=>true)
Answer.create!(:id=>30,:question_id=>5,:title=>'검정색',:enable=>true)
Answer.create!(:id=>31,:question_id=>5,:title=>'녹색',:enable=>true)
Answer.create!(:id=>32,:question_id=>5,:title=>'회색',:enable=>true)
Answer.create!(:id=>33,:question_id=>5,:title=>'파란색',:enable=>true)
Answer.create!(:id=>34,:question_id=>5,:title=>'기타',:enable=>true)


SubQuestion.create!(:id=>1,:answer_id=>34,:title=>'아래 눈색상과 일치하는것 선택',:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'1',:photo=>File.open(Rails.root.join("app","assets", "images", "10_01.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'2',:photo=>File.open(Rails.root.join("app","assets", "images", "10_02.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'3',:photo=>File.open(Rails.root.join("app","assets", "images", "10_03.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'4',:photo=>File.open(Rails.root.join("app","assets", "images", "10_04.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'5',:photo=>File.open(Rails.root.join("app","assets", "images", "10_05.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'6',:photo=>File.open(Rails.root.join("app","assets", "images", "10_06.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'7',:photo=>File.open(Rails.root.join("app","assets", "images", "10_07.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'8',:photo=>File.open(Rails.root.join("app","assets", "images", "10_08.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'9',:photo=>File.open(Rails.root.join("app","assets", "images", "10_09.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'10',:photo=>File.open(Rails.root.join("app","assets", "images", "10_10.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'11',:photo=>File.open(Rails.root.join("app","assets", "images", "10_11.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'12',:photo=>File.open(Rails.root.join("app","assets", "images", "10_12.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'13',:photo=>File.open(Rails.root.join("app","assets", "images", "10_13.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'14',:photo=>File.open(Rails.root.join("app","assets", "images", "10_14.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'15',:photo=>File.open(Rails.root.join("app","assets", "images", "10_15.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'16',:photo=>File.open(Rails.root.join("app","assets", "images", "10_16.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'17',:photo=>File.open(Rails.root.join("app","assets", "images", "10_17.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'18',:photo=>File.open(Rails.root.join("app","assets", "images", "10_18.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'19',:photo=>File.open(Rails.root.join("app","assets", "images", "10_19.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'20',:photo=>File.open(Rails.root.join("app","assets", "images", "10_20.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'21',:photo=>File.open(Rails.root.join("app","assets", "images", "10_21.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'22',:photo=>File.open(Rails.root.join("app","assets", "images", "10_22.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'23',:photo=>File.open(Rails.root.join("app","assets", "images", "10_23.jpg")),:enable=>true)
SubAnswer.create!(:sub_question_id=>1,:title=>'24',:photo=>File.open(Rails.root.join("app","assets", "images", "10_24.jpg")),:enable=>true)

Answer.create!(:id=>35,:question_id=>6,:title=>'머리숱이 풍성하다',:photo=>File.open(Rails.root.join("app","assets", "images", "22_01.jpg")),:enable=>true)
Answer.create!(:id=>36,:question_id=>6,:title=>'머리숱이 보통이다',:photo=>File.open(Rails.root.join("app","assets", "images", "22_02.jpg")),:enable=>true)
Answer.create!(:id=>37,:question_id=>6,:title=>'머리숱이 적다',:photo=>File.open(Rails.root.join("app","assets", "images", "22_03.jpg")),:enable=>true)
Answer.create!(:id=>38,:question_id=>6,:title=>'약간 탈모가 있다',:photo=>File.open(Rails.root.join("app","assets", "images", "22_04.jpg")),:enable=>true)
Answer.create!(:id=>39,:question_id=>6,:title=>'탈모되었다',:photo=>File.open(Rails.root.join("app","assets", "images", "22_05.jpg")),:enable=>true)
Answer.create!(:id=>40,:question_id=>6,:title=>'머리카락이 거의 없다',:photo=>File.open(Rails.root.join("app","assets", "images", "22_06.jpg")),:enable=>true)

Answer.create!(:id=>41,:question_id=>7,:title=>'아니오, 흡연을 한 적이 없습니다.',:enable=>true)
Answer.create!(:id=>42,:question_id=>7,:title=>'예',:enable=>true)
Answer.create!(:id=>43,:question_id=>7,:title=>'아니오, 하지만 과거에 흡연을 한 경험이 있습니다',:enable=>true)
  SubQuestion.create!(:id=>2,:answer_id=>42,:title=>'흡연기간',:enable=>true)
    SubAnswer.create!(:sub_question_id=>2,:title=>'년',:has_custom=>true,:enable=>true)
    SubAnswer.create!(:sub_question_id=>2,:title=>'개월',:has_custom=>true,:enable=>true)
  SubQuestion.create!(:id=>3,:answer_id=>42,:title=>'흡연량',:enable=>true)
    SubAnswer.create!(:sub_question_id=>3,:title=>'갑',:has_custom=>true,:enable=>true)
    SubAnswer.create!(:sub_question_id=>3,:title=>'개피',:has_custom=>true,:enable=>true)
  SubQuestion.create!(:id=>4,:answer_id=>42,:title=>'1주일 평균 흡연빈도',:enable=>true)
    SubAnswer.create!(:sub_question_id=>4,:title=>'주 1~2회',:enable=>true)
    SubAnswer.create!(:sub_question_id=>4,:title=>'주 3~4회',:enable=>true)
    SubAnswer.create!(:sub_question_id=>4,:title=>'거의 매일',:enable=>true)

  SubQuestion.create!(:id=>5,:answer_id=>43,:title=>'과거에 흡연 경험이 있는 경우, 과거 흡연기간',:enable=>true)
    SubAnswer.create!(:sub_question_id=>5,:title=>'년',:has_custom=>true,:enable=>true)
    SubAnswer.create!(:sub_question_id=>5,:title=>'개월',:has_custom=>true,:enable=>true)
  SubQuestion.create!(:id=>6,:answer_id=>43,:title=>'금연(흡연 중지) 이후 현재까지의 기간',:enable=>true)
    SubAnswer.create!(:sub_question_id=>6,:title=>'년',:has_custom=>true,:enable=>true)
    SubAnswer.create!(:sub_question_id=>6,:title=>'개월',:has_custom=>true,:enable=>true)

Answer.create!(:id=>44,:question_id=>8,:title=>'아니오',:enable=>true)
Answer.create!(:id=>45,:question_id=>8,:title=>'예',:enable=>true)
  SubQuestion.create!(:id=>7,:answer_id=>45,:title=>'평균 음주빈도',:enable=>true)
    SubAnswer.create!(:sub_question_id=>7,:title=>'한 달에 한번 정도',:enable=>true)
    SubAnswer.create!(:sub_question_id=>7,:title=>'주 1~2회 ',:enable=>true)
    SubAnswer.create!(:sub_question_id=>7,:title=>'주 3~4회',:enable=>true)
    SubAnswer.create!(:sub_question_id=>7,:title=>'거의 매일',:enable=>true)
  SubQuestion.create!(:id=>8,:answer_id=>45,:title=>'평균 음주량 (택일 또는 복수 기재 가능)',:enable=>true)
    SubAnswer.create!(:sub_question_id=>8,:title=>'소주기준',:has_custom=>true,:enable=>true)
    SubAnswer.create!(:sub_question_id=>8,:title=>'맥주기준',:has_custom=>true,:enable=>true)
    SubAnswer.create!(:sub_question_id=>8,:title=>'와인기준',:has_custom=>true,:enable=>true)

Answer.create!(:id=>46,:question_id=>9,:title=>'예',:enable=>true)
Answer.create!(:id=>47,:question_id=>9,:title=>'아니오',:enable=>true)

Answer.create!(:id=>48,:question_id=>10,:title=>'예',:enable=>true)
Answer.create!(:id=>49,:question_id=>10,:title=>'아니오',:enable=>true)




############# test data #################

User.create!(:id=>1,:name=>'어흥',:login_id => 'toughjjh@gmail.com',:password => 'a12345', :password_confirmation => 'a12345',:birthday=>'1981-06-02',:job=>'웹프로그래머',:live_type_id=>2,:education_id=>5,:sex=>true,:enable=>true)
User.create!(:id=>2,:name=>'라라라랄',:login_id => 'test',:password => 'a12345', :password_confirmation => 'a12345',:birthday=>'1981-06-02',:job=>'무',:live_type_id=>2,:education_id=>5,:sex=>false,:enable=>true)
User.create!(:id=>3,:name=>'멍멍',:login_id => 'U10K-00001',:password => 'a12345', :password_confirmation => 'a12345',:birthday=>'1981-06-02',:job=>'애완견',:live_type_id=>1,:education_id=>4,:sex=>false,:enable=>true)
User.create!(:id=>4,:name=>'야옹',:login_id => 'U10K-00002',:password => 'a12345', :password_confirmation => 'a12345',:birthday=>'1981-06-02',:job=>'쥐사냥',:live_type_id=>1,:education_id=>3,:sex=>true,:enable=>true)
User.create!(:id=>5,:name=>'ㅋㅋㅋ',:login_id => 'U10K-00003',:password => 'a12345', :password_confirmation => 'a12345',:birthday=>'1981-06-02',:job=>'연구원',:live_type_id=>1,:education_id=>5,:sex=>true,:enable=>true)
User.create!(:id=>6,:name=>'나야나',:login_id => 'U10K-00004',:password => 'a12345', :password_confirmation => 'a12345',:birthday=>'1981-06-02',:job=>'교수',:live_type_id=>2,:education_id=>2,:sex=>false,:enable=>true)
User.create!(:id=>7,:name=>'뿌웅',:login_id => 'U10K-00005',:password => 'a12345', :password_confirmation => 'a12345',:birthday=>'1981-06-02',:job=>'학생',:live_type_id=>1,:education_id=>1,:sex=>false,:enable=>true)
User.create!(:id=>8,:name=>'꽁치',:login_id => 'U10K-00006',:password => 'a12345', :password_confirmation => 'a12345',:birthday=>'1981-06-02',:job=>'조교수',:live_type_id=>2,:education_id=>1,:sex=>false,:enable=>true)
User.create!(:id=>9,:name=>'ㅎㅎㅎㅎ',:login_id => 'U10K-00007',:password => 'a12345', :password_confirmation => 'a12345',:birthday=>'1981-06-02',:job=>'연구원',:live_type_id=>2,:education_id=>5,:sex=>false,:enable=>true)
User.create!(:id=>10,:name=>'쑤왕~',:login_id => 'U10K-00008',:password => 'a12345', :password_confirmation => 'a12345',:birthday=>'1981-06-02',:job=>'대학원생(학생)',:live_type_id=>1,:education_id=>4,:sex=>true,:enable=>true)

Family.create!(:id=>1,:family_category_id=>1,:member=>1,:enable=>true)
Family.create!(:id=>2,:family_category_id=>2,:member=>1,:enable=>true)
Family.create!(:id=>3,:family_category_id=>3,:member=>3,:enable=>true)
Family.create!(:id=>4,:family_category_id=>4,:member=>2,:enable=>true)
Family.create!(:id=>5,:family_category_id=>1,:member=>3,:enable=>true)
Family.create!(:id=>6,:family_category_id=>1,:member=>2,:enable=>true)
Family.create!(:id=>7,:family_category_id=>1,:member=>1,:enable=>true)

UsersFamily.create!(:user_id=>1,:family_id=>1)
UsersFamily.create!(:user_id=>1,:family_id=>2)
UsersFamily.create!(:user_id=>2,:family_id=>2)
UsersFamily.create!(:user_id=>3,:family_id=>3)
UsersFamily.create!(:user_id=>4,:family_id=>4)
UsersFamily.create!(:user_id=>4,:family_id=>5)
UsersFamily.create!(:user_id=>5,:family_id=>6)
UsersFamily.create!(:user_id=>6,:family_id=>7)
