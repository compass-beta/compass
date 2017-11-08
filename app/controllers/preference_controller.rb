class PreferenceController < ApplicationController
	layout 'preference'

	def index
	  @jobs = Job.all
	  @occupations = Occupation.all
	  @jobAnswer = JobAnswerForm.new()

	  render 'preference'
	end

	def save_session
	
	  render 'preference'
	end
end