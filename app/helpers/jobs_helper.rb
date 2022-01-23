module JobsHelper
  def job_sort_options_for_select
    [
      ['Posting Date Ascending', 'created_at-asc'],
      ['Posting Date Descending', 'created_at-desc'],
      ['Title Ascending', 'title-asc'],
      ['Title Descending', 'title-desc']
    ]
  end

  def status_options_for_select
    Job.statuses.map{|key, _value| [key.humanize, key]}
  end
end
