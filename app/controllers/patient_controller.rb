class PatientController < ApplicationController
 before_action :find_patient, only: [:show, :edit, :update, :destroy, :edit_image, :update_image]
 before_action :authenticate_user!, :except=> [:startup]

 def startup
  
 end
 
 def index
 	@patient = Patient.all

 end

 def show
 	# @diagnosis = Diagnosis.find(@patient)
 	@information = Information.where(:patient_id =>params[:id])
  @information.each do |i|
 	  @info_id = i.id
  end
  @info=Information.find(@info_id)
  @appointment = Appointment.where(:patient_id=>params[:id])
 end

 def new
 	# @patient = current_user.patient.build
  @patient = Patient.new
  @patient.build_information

 end

 def new_image
  # @patient = current_user.patient.build  
 end

 def create_image
  @patient = current_user.patient.build(image_params)
  if @patient.save
    flash[:alert]="<big><span class='glyphicon glyphicon-user'></span></big> Image uploaded."
    redirect_to :back
  else
    flash[:error]="<big><span class='glyphicon glyphicon-user'></span></big> image not added."
    render 'new_image'
  end
 end

 def update_image
  if @patient.update(image_params)
        flash[:alert]="<big><span class='glyphicon glyphicon-user'></span></big> Patient basic info updated."
    redirect_to @patient
  else
        flash[:error]="<big><span class='glyphicon glyphicon-user'></span></big> Error editing patient."
    render 'edit'
  end
 end

 def create
 	@patient = current_user.patient.build(patient_params)
  @p_id = @patient.id
  if @patient.save
    user = User.find(current_user.id)
      user.patient_id = @patient.id
    user.save
    flash[:alert]="<big><span class='glyphicon glyphicon-user'></span></big> New Patient added."
 		redirect_to @patient
 	else
      	flash[:error]="<big><span class='glyphicon glyphicon-user'></span></big> Patient not added."
 		render 'new'
 	end
 end

 def edit
 	
 end

 def edit_image
  
 end

 def update
 	if @patient.update(patient_params)
      	flash[:alert]="<big><span class='glyphicon glyphicon-user'></span></big> Patient basic info updated."
 		    redirect_to @patient
 	else
      	flash[:error]="<big><span class='glyphicon glyphicon-user'></span></big> Error editing patient."
 		render 'edit'
 	end
 end

 def destroy
 	@patient.destroy
 	Information.find(@patient).destroy
 	flash[:alert]="<big><span class='glyphicon glyphicon-trash'></span></big> Patient information removed..."
 	redirect_to '/patient'
 end

 def logout
 	session.clear
 	flash[:alert]="<big><span class='glyphicon glyphicon-user'></span></big> Thank you for using PIS..."
 	redirect_to root_path
 end

 def set_appointment
  @id = current_user.id
  @appointment = Appointment.new
  @patient = Patient.find(params[:id])
  @patient_name = @patient.fullname
  @mode = "Online Booking"
 end

 private

 def find_patient
 	@patient = Patient.find(params[:id])
 end

 def patient_params
 	params.require(:patient).permit(:lname, :fname, :mi, :address, :image, 
                                  information_attributes: [:status, :sex, :age, :bday,
                                        :occupation, :homephone,:businessphone, 
                                        :mobilephone, :referredby, :spouse])
 end

 def image_params
  params.require(:patient).permit(:image)
 end
 
end
