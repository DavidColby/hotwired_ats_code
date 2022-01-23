class ChartsController < ApplicationController
  before_action :set_chart
  before_action :authenticate_user!

  def show
    report_data = @chart.constantize.new(current_user.account_id).generate
    @labels = report_data.keys.to_json
    @series = report_data.values.to_json
    @chart_partial = chart_to_partial
  end

  private

  def set_chart
    @chart = params[:chart_type]
  end

  def chart_to_partial
    @chart.gsub('Charts::', '').underscore
  end
end
