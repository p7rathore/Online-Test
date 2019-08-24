class Question < ApplicationRecord
  belongs_to :paper
	has_many :options,dependent: :destroy
	has_many :answers,dependent: :destroy
  accepts_nested_attributes_for :options,allow_destroy: true
  
  def correct
  	options.where(is_correct: true)
  end

  def hours
  	if self.duration
			self.duration/3600
		else
			0
		end
	end

	def hours=(hour)
		self.duration=hour.to_i*3600+minutes*60+seconds
	end

  def minutes
  	if self.duration
			(self.duration/60)%60
		else
			0
		end
	end

	def minutes=(minute)
		self.duration=hours*3600+minute.to_i*60+seconds
	end

	def seconds
  	if self.duration
			self.duration%60
		else
			0
		end
	end

	def seconds=(second)
		self.duration=hours*3600+minutes*60+second.to_i
	end

end

