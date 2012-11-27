module Openmeta
  def self.with_friendly_errors
    begin
      yield
    rescue Openmeta::OpenmetaError => e
      Openmeta.ui.error e.message
      Openmeta.ui.debug e.backtrace.join("\n")
      exit e.status_code
    rescue Interrupt => e
      Openmeta.ui.error "\nQuitting..."
      Openmeta.ui.debug e.backtrace.join("\n")
      exit 1
    rescue SystemExit => e
      exit e.status
    rescue Exception => e
      Openmeta.ui.error(
        "Unfortunately, a fatal error has occurred. Please see the Openmeta \n" \
        "troubleshooting documentation. Thanks!\n  #{e.inspect} #{e.backtrace.join("\n")}\n")
      raise e
    end
  end
end

