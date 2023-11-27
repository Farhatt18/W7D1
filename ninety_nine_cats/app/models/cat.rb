class Cat < ApplicationRecord
    CAT_COLORS = ["orange", "black","white", "grey", "brown"].freeze 

    validates :name, :birth_date, :description, presence: true
    validates :color, presence: true, inclusion: {in: CAT_COLORS}
    validates :sex, presence: true, inclusion: {in: ["M", "F"]}
    validate :birth_date_cannot_be_future


    def birth_date_cannot_be_future
        if birth_date.present? && birth_date > Date.today
            errors.add(:birth_date, "can't be in the future")
        end
    end

    def age 
        age_date = (Date.today.year - self.birth_date.year) 
        # time_ago_in_words(age_date)
    end

end

