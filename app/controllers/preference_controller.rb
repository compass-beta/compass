class PreferenceController < ApplicationController
	layout 'preference'

	def index
	  @jobs = Job.all
	  @occupations = Occupation.all
	  @cities = City.all
	  @interests = Interest.all
	  @jobAnswer = JobAnswerForm.new()

	  render 'preference'
	end

	def search
		@users = City.where('city LIKE(?)', "%#{params[:keyword]}%") #paramsとして送られてきたkeyword（入力された語句）で、Userモデルのnameカラムを検索し、その結果を@usersに代入する
		respond_to do |format| 
			format.json { render 'preference', json: @users } #json形式のデータを受け取ったら、@usersをデータとして返す そしてindexをrenderで表示する
		end
	end

	def save_session
	# byebug
	  render 'preference'
	end
end