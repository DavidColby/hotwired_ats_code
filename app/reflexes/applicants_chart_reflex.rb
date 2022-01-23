class ApplicantsChartReflex < ApplicationReflex
  def update
    report_data = retrieve_data(current_user.account_id, params)
    categories, series = assign_data(report_data)

    cable_ready
      .set_dataset_property(name: 'applicantsChartLabelsValue', selector: '#applicants-chart-container', value: categories)
      .set_dataset_property(name: 'applicantsChartSeriesValue', selector: '#applicants-chart-container', value: series)
      .broadcast

    morph :nothing
  end

  def retrieve_data(account_id, params)
    Charts::ApplicantsChart.new(account_id, params).generate
  end

  def assign_data(data)
    [data.keys.to_json, data.values.to_json]
  end
end
