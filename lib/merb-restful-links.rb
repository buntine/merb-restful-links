module Merb
  module AssetsMixin

    alias_method :orig_link_to, :link_to

    def link_to(name, url='', opts={})
      if opts.include?(:method)
        method = opts.delete(:method)

        if [ :put, :delete ].include? method
          opts[:onclick] = "var f = document.createElement('form'); f.style.display = 'none'; " +
                           "this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href; " +
                           "var m = document.createElement('input'); m.setAttribute('type', 'hidden'); " +
                           "m.setAttribute('name', '_method'); m.setAttribute('value', '#{method}'); " +
                           "f.appendChild(m);f.submit(); return false;"
        else
          raise ArgumentError, "The :method option only accepts :put or :delete."
        end
      end

      orig_link_to name, url, opts
    end

  end
end
