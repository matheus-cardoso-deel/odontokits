class DownloadsController < ApplicationController
 
  def show
      send_kit_pdf
  end
 
  private
 
  def kit_pdf
    kit = Kit.find(params[:kit_id])
    kits = kit.aluno.kits.to_a - [kit]
    KitTagPdf.new(kit, kits, params[:all_kits])
  end
 
  def send_kit_pdf
    send_file kit_pdf.to_pdf,
      filename: kit_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end
end