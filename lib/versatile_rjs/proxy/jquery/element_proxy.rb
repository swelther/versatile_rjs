module VersatileRJS
  class Proxy
    class Jquery
      class ElementProxy < VersatileRJS::Proxy::ElementProxy
        def initialize(page, id)
          super(page, id, "$('##{id}')")
        end

        def _replace_html(content)
          call :html, content
        end

        def _replace(content)
          call :replaceWith, content
        end

        def _insert_html(position, content)
          case position
          when :top
            call :prepend, content
          when :bottom
            call :append, content
          end
        end

        def _remove
          call :remove
        end

        def _value=(value)
          call :val, value
        end

        def _value
          call :val
        end

        def _inner_html
          call :html
        end

        def remove
          call :remove
        end

        def select(selector)
          call :find, selector
        end
      end
    end
  end
end
