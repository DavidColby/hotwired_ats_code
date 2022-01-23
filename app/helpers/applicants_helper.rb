module ApplicantsHelper
  def applicant_sort_options_for_select
    [
      ['Application Date Ascending', 'created_at-asc'],
      ['Application Date Descending', 'created_at-desc']
    ]
  end
end
