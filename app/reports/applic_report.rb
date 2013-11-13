class ApplicReport < Prawn::Document

  def generate(applic)
  	@applic = applic
    text "Hello World #{@applic.fio_eng}"
  end

end