require "render_anywhere"
 
class KitTagPdf #Why in models? -> Why not?
  include RenderAnywhere
 
  def initialize(kit, kits, all_kits)
    @kit = kit
    @kits = kits
    @all_kits = all_kits
  end
 
  def to_pdf
    pdf_kit = PDFKit.new(as_html, options = {
    'enable_local_file_access': 'true',
    'page-size': 'A4',
    'margin-top': '0in',
    'margin-right': '0.078in',
    'margin-bottom': '0in',
    'margin-left': '0.078in',
    'encoding': "UTF-8",
    'page-width': '2.2in',
    'page-height': '0.90in'
    })
    pdf_kit.to_file("#{Rails.root}/public/kit.pdf") # Converts to pdf
  end
 
  def filename
    "Kit #{kit.id}.pdf"
  end
 
  private
 
    attr_reader :kit, :kits, :all_kits
 
    def as_html
      render template: "kits/pdf", layout: "kit_pdf", locals: { kit: kit, kits: kits, all_kits: all_kits }
    end
end
