class AppointmentController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @appointment = Appointment.select('appointments.*, concat(a.lname,", ",a.fname, " ",a.mi) as name').joins('Left join patients a on appointments.patient_id=a.id').order(:appointment_date)
  end

  def create
    @appointment = Appointment.create(appointment_params)
    @appointment.user_id = current_user.id
    if @appointment.save
      flash[:alert]="<big><span class='glyphicon glyphicon-book'></span></big> Appointment added."
      redirect_to appointments_path
    else
      flash[:error]="<big><span class='glyphicon glyphicon-book'></span></big> Appointment not added."
      render 'new'
    end
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