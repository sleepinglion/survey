crumb :root do
  link t(:home), root_path
end

crumb :quesetions do
   link t('activerecord.models.question'), questions_path
end

crumb :question do |question|
   link question.title, question_path(question)
   parent :questions
end

crumb :users do
   link t('activerecord.models.user'), users_path
end
