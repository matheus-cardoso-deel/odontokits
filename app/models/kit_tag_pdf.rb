require "render_anywhere"
 
class KitTagPdf
  include RenderAnywhere
 
  def initialize(kit)
    @kit = kit
  end
 
  def to_pdf
    pdf_kit = PDFKit.new(as_html, page_size: 'A4')
    pdf_kit.to_file("#{Rails.root}/public/kit.pdf")
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