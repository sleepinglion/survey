class HomeController < ApplicationController
  load_and_authorize_resource

    def index
        total_var

        if @total_answered.zero?
          @question = Question.where(:id=>1).first
          @users_question = UsersQuestion.new
          b = @users_question.users_questions_answers.build
          c=b.users_questions_answers_sub_questions.build
          b.users_questions_answers_custom_answers.build
          d=c.users_questions_answers_sub_questions_sub_answers.build
          d.users_questions_answers_sub_questions_sub_answers_custom_answers.build

          render template: 'questions/show'
        else
          if current_user.sex
            female_only=false
          else
            female_only=[true,false]
          end
          @question_categories=QuestionCategory.where(:female_only=>female_only,:enable=>true)

          @next_question_id=get_next_question_id
        end
    end

    def no_auth; end
end
