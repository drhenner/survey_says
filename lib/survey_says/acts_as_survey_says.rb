
module SurveySays
  module ActsAsSurveySays
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def acts_as_survey_says(options = {})
        # your code will go here
      end
    end

    def add_answers(answer_ids)
      self.answer_ids = answer_ids | answer_ids
      self.save
    end

    def score_user!
      score_answer_ids = user_answers.map(&:answer_id)
      Score.group(:survey_property_id).
            select("scores.*, SUM(scores.value) as value, survey_properties.name").
            joins(:survey_property).
            where(['scores.answer_id IN (?)',score_answer_ids]).all
    end
    def score_questionnaire(questionnaire_id)
      questionnaire = Questionnaire.includes({:questions => :answers}).find(questionnaire_id)
      score_answer_ids = questionnaire.questions.map(&:answer_ids).flatten & answer_ids
      Score.group(:survey_property_id).
            select("scores.*, SUM(scores.value) as value, survey_properties.name").
            joins(:survey_property).
            where(['scores.answer_id IN (?)',score_answer_ids]).all
    end
  end
end

ActiveRecord::Base.send :include, SurveySays::ActsAsSurveySays

=begin

module SurveySays
  module ActsAsSurveySays
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def acts_as_survey_says(options = {})
        # your code will go here
      end
    end
  end
end

ActiveRecord::Base.send :include, Yaffle::ActsAsSurveySays

=end
