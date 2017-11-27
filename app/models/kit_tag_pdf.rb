require "render_anywhere"
 
class KitTagPdf #Why in models? -> Why not?
  include RenderAnywhere
 
  def initialize(kit)
    @kit = kit
  end
 
  def to_pdf
    pdf_kit = PDFKit.new(as_html, options = {
    'page-size': 'A4',
    'margin-top': '0in',
    'margin-right': '0in',
    'margin-bottom': '0in',
    'margin-left': '0in',
    'encoding': "UTF-8",
    'page-width': '1.77in',
    'page-height': '0.78in'
    })
    pdf_kit.to_file("#{Rails.root}/public/kit.pdf") # Converts to pdf
  end
 
  def filename
    "Kit #{kit.id}.pdf"
  end
 
  private
 
    attr_reader :kit
 
    def as_html
      render template: "kits/pdf", layout: "kit_pdf", locals: { kit: kit }
    end
end