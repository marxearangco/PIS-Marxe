class PatientsController < ApplicationController
 before_action :find_patient, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_user!

 def startup
 end
 
 def index
 	@patient = Patient.all
 	@grid = initialize_grid(@patient)
 end

 def show
 	# @diagnosis = Diagnosis.find(@patient)
 	@information = Information.where(:id =>@patient)
 	@info = Information.find(@patient)
 end

 def new
 	@patient = current_user.patient.build

 end

 def create
 	@patient = current_user.patient.build(patient_params)
 	if @patient.save
 		@info = Information.new
 		@info.patient_id = @patient.id
 		@info.save
      	flash[:alert]="<big><span class='glyphicon glyphicon-user'></span></big> New Patient added."
 		redirect_to :back
 	else
      	flash[:error]="<big><span class='glyphicon glyphicon-user'></span></big> Patient not added."
 		render 'new'
 	end
 end

 def edit
 	
 end

 def update
 	if @patient.update(patient_params)
      	flash[:alert]="<big><span class='glyphicon glyphicon-user'></span></big> Patient basic info updated."
 		redirect_to root_path
 	else
      	flash[:error]="<big><span class='glyphicon glyphicon-user'></span></big> Error editing patient."
 		render 'edit'
 	end
 end

 def destroy
 	@patient.destroy
 	Information.find(@patient).destroy
  	flash[:alert]="<big><span class='glyphicon glyphicon-user'></span></big> Patient information removed..."
 	redirect_to root_path
 end

 def logout
 	session.clear
  	flash[:alert]="<big><span class='glyphicon glyphicon-user'></span></big> Thank you for using PIS..."
 	redirect_to root_path
 end


 private

 def find_patient
 	@patient = Patient.find(params[:id])
 end

 def patient_params
 	params.require(:patient).permit(:lname, :fname, :mi, :address, :image)
 end

 
end
