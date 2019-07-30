class StaticPagesController < ApplicationController
  def home
    @posts = Post.publish.newest.limit 6
    @jobs = Job.newest.limit 5
    @client = Client.new
    @slider_image = Image.publish.last
  end

  def help; end

  def about; end

  def contact
    @client = Client.new
  end

  def bussiness_content; end

  def recruitment_benefit; end

  def specific_skills; end

  def engineer_interpreter; end

  def study_abroad; end

  def download_pdf
    send_file(
      "#{Rails.root}/public/特定技能について.pdf",
      filename: "特定技能について.pdf",
      type: "application/pdf"
    )
  end

  def interns; end

  def job_details; end

  def question; end
end
