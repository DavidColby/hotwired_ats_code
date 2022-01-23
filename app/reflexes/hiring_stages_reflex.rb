class HiringStagesReflex < ApplicationReflex
  def update
    data = retrieve_data(params[:job_id])
    stage_labels, stage_series = assign_data(data)

    cable_ready
      .set_dataset_property(name: 'hiringStagesLabelsValue', selector: '#stage-chart-container', value: stage_labels)
      .set_dataset_property(name: 'hiringStagesSeriesValue', selector: '#stage-chart-container', value: stage_series)
      .broadcast

    morph :nothing
  end

  def retrieve_data(job_id)
    Charts::HiringStagesChart.new(current_user.account_id, job_id).generate
  end

  def assign_data(data)
    [data.keys.map(&:humanize).to_json, data.values.to_json]
  end
end
