class AppointmentController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @appointment = Appointment.joins(:patient).where("DATE(appointment_date) = '#{Date.today}'")
    # @appointment = Appointment.select('appointments.*, concat(a.lname,", ",a.fname, " ",left(a.mi,1),".") as name')
                  # .joins('Left join patients a on appointments.patient_id=a.id')
                  # .where("DATE(appointment_date) = '#{Date.today}'")
                  # .order(:appointment_date)

    # @appointment = initialize_grid(Appointment,
    #   include: :patient,
    #   #conditions: {:patient_id=>'5'},
    #   per_page: 10
    # )
  end

  def create
    @appointment = Appointment.create(appointment_params)
    @appointment.user_id = current_user.id
    if @appointment.save
      flash[:alert]="<big><span class='glyphicon glyphicon-book'></span></big> Appointment added."
      if current_user.role=="patient"
        redirect_to patient_path(@appointment.patient_id)
      else
        redirect_to appointments_path
      end
    else
      flash[:error]="<big><span class='glyphicon glyphicon-book'></span></big> Appointment not added."
      render 'new'
    end
  end

  def calendar
    @appointment = Appointment.select('concat(lname,", ",fname," ", left(mi,1),".") as title, appointment_date as start, patient_id').joins('left join patients on appointments.patient_id = patients.id')
    @ev = ""
    @events = "" 
    @appointment.each do |e|
      @ev << "{ title : '#{e.title}', start : '#{e.start.strftime("%F")}', url: '/patient/#{e.patient_id}'},"
    end
    @events << "[" << @ev.chop << "]"
  end  

  def update
    if @appointment.update(appointment_params)
      flash[:alert]="<big><span class='glyphicon glyphicon-book'></span></big> Appointment updated."
      redirect_to appointments_path
    else
      render 'edit'
    end
  end

  def destroy
    @appointment.destroy
    flash[:alert]="<big><span class='glyphicon glyphicon-book'></span></big> Appointment Cancelled."
    redirect_to appointments_path
  end

  def show
    # @patient_name = "Please Select.."
    @patient = Patient.find(@appointment.patient_id)
  end
  
  def new
    @id = current_user.id
    @appointment = Appointment.new
    @patient_name = "Please Select.."
  end

  def edit
  end

  private

  def find_appointment
   @appointment = Appointment.find(params[:id]) 
  end

  def appointment_params
    params.require(:appointment).permit(:patient_id, :purpose, :appointment_date)
  end
end