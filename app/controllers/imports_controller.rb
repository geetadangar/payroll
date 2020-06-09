class ImportsController < ApplicationController

  # def index
  	# @company =Company.all
  # end

  def new
  	# @company =Company.all
    @payrollimport = PayrollImport.new
  end

  def create
    import(file_params)
    redirect_to new_import_path, notice: "file imported succesfully."
  end

  def import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(2)
    (3..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      Salary.file_save(row)
    end
  end

  def open_spreadsheet(file)
    case File.extname(params[:file].original_filename)
    when ".csv" then Csv.new(params[:file].path, nil, :ignore)
    when ".xls" then Roo::Excel.new(params[:file].path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(params[:file].path)
    else raise "Unknown file type: #{params[:file].original_filename}"
    end
  end

  private

  def file_params
    params.permit(:file)
  end

end