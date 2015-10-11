class PatientDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Patient.count,
      iTotalDisplayRecords: patient.total_entries,
      aaData: data
    }
  end

private

  def data
    patients.map do |patient|
      [
        link_to(patient.id, patient),
        h(patient.fullname),
        h(patient.address)
      ]
    end
  end

  def patients
    @patients ||= fetch_patients
  end

  def fetch_patients
    patients = Patient.order("#{sort_column} #{sort_direction}")
    patients = patients.page(page).per_page(per_page)
    if params[:sSearch].present?
      patients = patients.where("id like :search or fullname like :search", search: "%#{params[:sSearch]}%")
    end
    patients
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id category address]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end