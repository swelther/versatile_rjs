module VersatileRJS
  class TemplateHandler
    def self.call(template)
      new.call(template)
    end

    def call(template)
      page_procedure = "lambda{|page|" + template.source + "}"
      script =<<-EOF
      statement = lambda{|page|#{template.source}
        page}.call(VersatileRJS::Page.new(self)).to_script
      statement = "try{" + statement + "}catch(e){alert('" + escape_javascript(statement) + "');throw e;}" if Rails.env.development?
      statement
      EOF
      script
    end
  end
end
